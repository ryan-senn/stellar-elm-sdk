module Endpoints.EffectsForTransaction.View exposing (view)

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

import Endpoints.EffectsForTransaction.Msg as EffectsForTransaction
import Endpoints.EffectsForTransaction.MsgFactory as EffectsForTransaction
import Endpoints.EffectsForTransaction.Model as EffectsForTransaction

import Endpoints.EffectsForTransaction.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> EffectsForTransaction.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Effects for Transaction" "https://www.stellar.org/developers/horizon/reference/endpoints/offers-for-transaction.html"
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
                    |> Html.map (EffectsForTransaction.UpdateTransaction >> EffectsForTransaction.SettingsMsg >> EffectsForTransaction.composeMsg)
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
                    |> Html.map (EffectsForTransaction.UpdateCursor >> EffectsForTransaction.SettingsMsg >> EffectsForTransaction.composeMsg)
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
                    |> Html.map (EffectsForTransaction.UpdateLimit >> EffectsForTransaction.SettingsMsg >> EffectsForTransaction.composeMsg)
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
                        , onClick (EffectsForTransaction.UpdateSorting Sorting.Asc |> EffectsForTransaction.SettingsMsg |> EffectsForTransaction.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (EffectsForTransaction.UpdateSorting Sorting.Desc |> EffectsForTransaction.SettingsMsg |> EffectsForTransaction.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (EffectsForTransaction.Request endpoint model.settings |> EffectsForTransaction.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]