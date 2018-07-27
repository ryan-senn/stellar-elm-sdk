module Endpoints.OperationsForAccount.View exposing (view)

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

import Endpoints.OperationsForAccount.Msg as OperationsForAccount
import Endpoints.OperationsForAccount.MsgFactory as OperationsForAccount
import Endpoints.OperationsForAccount.Model as OperationsForAccount

import Endpoints.OperationsForAccount.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> OperationsForAccount.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Operations for Account" "https://www.stellar.org/developers/horizon/reference/endpoints/offers-for-account.html"
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
                        [ text "Account" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: GA2HGBJIJKI6O4XEM7CZWY5PS6GKSXL6D34ERAJYQSPYA6X6AI7HYW36)" ]
                    ]
                , model.settings.account
                    |> Input.view
                    |> Input.render
                    |> Html.map (OperationsForAccount.UpdateAccount >> OperationsForAccount.SettingsMsg >> OperationsForAccount.composeMsg)
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
                    |> Html.map (OperationsForAccount.UpdateCursor >> OperationsForAccount.SettingsMsg >> OperationsForAccount.composeMsg)
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
                    |> Html.map (OperationsForAccount.UpdateLimit >> OperationsForAccount.SettingsMsg >> OperationsForAccount.composeMsg)
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
                        , onClick (OperationsForAccount.UpdateSorting Sorting.Asc |> OperationsForAccount.SettingsMsg |> OperationsForAccount.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (OperationsForAccount.UpdateSorting Sorting.Desc |> OperationsForAccount.SettingsMsg |> OperationsForAccount.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (OperationsForAccount.Request endpoint model.settings |> OperationsForAccount.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]