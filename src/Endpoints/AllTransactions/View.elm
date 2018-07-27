module Endpoints.AllTransactions.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Sorting as Sorting

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints

import Endpoints.Styles as Css

import Endpoints.Views.Title as Title
import Endpoints.Views.Endpoint as Endpoint
import Endpoints.Views.Request as Request
import Endpoints.Views.Button as Button
import Endpoints.Views.Response as Response

import Endpoints.AllTransactions.Msg as AllTransactions
import Endpoints.AllTransactions.MsgFactory as AllTransactions
import Endpoints.AllTransactions.Model as AllTransactions

import Endpoints.AllTransactions.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> AllTransactions.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "All Transactions" "https://www.stellar.org/developers/horizon/reference/endpoints/transactions-all.html"
        , div
            [ Css.page ]
            [ h2
                []
                [ text "Request" ]
            , Endpoint.view endpoint
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Cursor" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 1)" ]
                    ]
                , model.settings.cursor
                    |> Input.view
                    |> Input.render
                    |> Html.map (AllTransactions.UpdateCursor >> AllTransactions.SettingsMsg >> AllTransactions.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Limit" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 200, default: 10)" ]
                    ]
                , model.settings.limit
                    |> IntInput.view
                    |> IntInput.render
                    |> Html.map (AllTransactions.UpdateLimit >> AllTransactions.SettingsMsg >> AllTransactions.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Sorting" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(default: asc)" ]
                    ]
                , div
                    []
                    [ span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Asc)
                        , onClick (AllTransactions.UpdateSorting Sorting.Asc |> AllTransactions.SettingsMsg |> AllTransactions.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (AllTransactions.UpdateSorting Sorting.Desc |> AllTransactions.SettingsMsg |> AllTransactions.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder (endpointFromInput endpoint) model.settings)
            , Button.view model.isLoading (AllTransactions.Request (endpointFromInput endpoint) model.settings |> AllTransactions.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]