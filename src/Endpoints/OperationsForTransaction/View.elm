module Endpoints.OperationsForTransaction.View exposing (view)

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

import Endpoints.OperationsForTransaction.Msg as OperationsForTransaction
import Endpoints.OperationsForTransaction.MsgFactory as OperationsForTransaction
import Endpoints.OperationsForTransaction.Model as OperationsForTransaction

import Endpoints.OperationsForTransaction.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> OperationsForTransaction.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Operations for Transaction" "https://www.stellar.org/developers/horizon/reference/endpoints/offers-for-transaction.html"
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
                        [ Css.labelMandatory ]
                        [ text "Hash" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 6391dd190f15f7d1665ba53c63842e368f485651a53d8d852ed442a446d1c69a)" ]
                    ]
                , model.settings.transaction
                    |> Input.view
                    |> Input.render
                    |> Html.fromUnstyled
                    |> Html.map (OperationsForTransaction.UpdateTransaction >> OperationsForTransaction.SettingsMsg >> OperationsForTransaction.composeMsg)
                ]
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
                    |> Html.fromUnstyled
                    |> Html.map (OperationsForTransaction.UpdateCursor >> OperationsForTransaction.SettingsMsg >> OperationsForTransaction.composeMsg)
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
                    |> Html.fromUnstyled
                    |> Html.map (OperationsForTransaction.UpdateLimit >> OperationsForTransaction.SettingsMsg >> OperationsForTransaction.composeMsg)
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
                        , onClick (OperationsForTransaction.UpdateSorting Sorting.Asc |> OperationsForTransaction.SettingsMsg |> OperationsForTransaction.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (OperationsForTransaction.UpdateSorting Sorting.Desc |> OperationsForTransaction.SettingsMsg |> OperationsForTransaction.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (OperationsForTransaction.Request endpoint model.settings |> OperationsForTransaction.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]