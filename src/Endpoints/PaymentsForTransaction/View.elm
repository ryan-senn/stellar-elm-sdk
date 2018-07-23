module Endpoints.PaymentsForTransaction.View exposing (view)

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

import Endpoints.PaymentsForTransaction.Msg as PaymentsForTransaction
import Endpoints.PaymentsForTransaction.MsgFactory as PaymentsForTransaction
import Endpoints.PaymentsForTransaction.Model as PaymentsForTransaction

import Endpoints.PaymentsForTransaction.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> PaymentsForTransaction.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Payments for Transaction" "https://www.stellar.org/developers/horizon/reference/endpoints/offers-for-transaction.html"
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
                    |> Html.map (PaymentsForTransaction.UpdateTransaction >> PaymentsForTransaction.SettingsMsg >> PaymentsForTransaction.composeMsg)
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
                    |> Html.map (PaymentsForTransaction.UpdateCursor >> PaymentsForTransaction.SettingsMsg >> PaymentsForTransaction.composeMsg)
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
                    |> Html.map (PaymentsForTransaction.UpdateLimit >> PaymentsForTransaction.SettingsMsg >> PaymentsForTransaction.composeMsg)
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
                        , onClick (PaymentsForTransaction.UpdateSorting Sorting.Asc |> PaymentsForTransaction.SettingsMsg |> PaymentsForTransaction.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (PaymentsForTransaction.UpdateSorting Sorting.Desc |> PaymentsForTransaction.SettingsMsg |> PaymentsForTransaction.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (PaymentsForTransaction.Request endpoint model.settings |> PaymentsForTransaction.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]