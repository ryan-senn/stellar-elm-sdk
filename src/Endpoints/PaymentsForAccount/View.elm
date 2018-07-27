module Endpoints.PaymentsForAccount.View exposing (view)

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

import Endpoints.PaymentsForAccount.Msg as PaymentsForAccount
import Endpoints.PaymentsForAccount.MsgFactory as PaymentsForAccount
import Endpoints.PaymentsForAccount.Model as PaymentsForAccount

import Endpoints.PaymentsForAccount.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> PaymentsForAccount.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Payments for Account" "https://www.stellar.org/developers/horizon/reference/endpoints/payments-for-account.html"
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
                    |> Html.map (PaymentsForAccount.UpdateAccount >> PaymentsForAccount.SettingsMsg >> PaymentsForAccount.composeMsg)
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
                    |> Html.map (PaymentsForAccount.UpdateCursor >> PaymentsForAccount.SettingsMsg >> PaymentsForAccount.composeMsg)
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
                    |> Html.map (PaymentsForAccount.UpdateLimit >> PaymentsForAccount.SettingsMsg >> PaymentsForAccount.composeMsg)
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
                        , onClick (PaymentsForAccount.UpdateSorting Sorting.Asc |> PaymentsForAccount.SettingsMsg |> PaymentsForAccount.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (PaymentsForAccount.UpdateSorting Sorting.Desc |> PaymentsForAccount.SettingsMsg |> PaymentsForAccount.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (PaymentsForAccount.Request endpoint model.settings |> PaymentsForAccount.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]