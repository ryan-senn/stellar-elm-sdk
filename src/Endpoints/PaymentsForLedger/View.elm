module Endpoints.PaymentsForLedger.View exposing (view)

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

import Endpoints.PaymentsForLedger.Msg as PaymentsForLedger
import Endpoints.PaymentsForLedger.MsgFactory as PaymentsForLedger
import Endpoints.PaymentsForLedger.Model as PaymentsForLedger

import Endpoints.PaymentsForLedger.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> PaymentsForLedger.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Payments for Ledger" "https://www.stellar.org/developers/horizon/reference/endpoints/offers-for-ledgerId.html"
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
                        [ text "Ledger" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 69859)" ]
                    ]
                , model.settings.ledgerId
                    |> IntInput.view
                    |> IntInput.render
                    |> Html.fromUnstyled
                    |> Html.map (PaymentsForLedger.UpdateLedgerId >> PaymentsForLedger.SettingsMsg >> PaymentsForLedger.composeMsg)
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
                    |> Html.map (PaymentsForLedger.UpdateCursor >> PaymentsForLedger.SettingsMsg >> PaymentsForLedger.composeMsg)
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
                    |> Html.map (PaymentsForLedger.UpdateLimit >> PaymentsForLedger.SettingsMsg >> PaymentsForLedger.composeMsg)
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
                        , onClick (PaymentsForLedger.UpdateSorting Sorting.Asc |> PaymentsForLedger.SettingsMsg |> PaymentsForLedger.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (PaymentsForLedger.UpdateSorting Sorting.Desc |> PaymentsForLedger.SettingsMsg |> PaymentsForLedger.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (PaymentsForLedger.Request endpoint model.settings |> PaymentsForLedger.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]