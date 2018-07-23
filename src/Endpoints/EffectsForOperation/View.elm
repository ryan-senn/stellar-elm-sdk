module Endpoints.EffectsForOperation.View exposing (view)

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

import Endpoints.EffectsForOperation.Msg as EffectsForOperation
import Endpoints.EffectsForOperation.MsgFactory as EffectsForOperation
import Endpoints.EffectsForOperation.Model as EffectsForOperation

import Endpoints.EffectsForOperation.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> EffectsForOperation.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Effects for Operation" "https://www.stellar.org/developers/horizon/reference/endpoints/offers-for-operationId.html"
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
                        [ text "Operation" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 69859)" ]
                    ]
                , model.settings.operationId
                    |> IntInput.view
                    |> IntInput.render
                    |> Html.fromUnstyled
                    |> Html.map (EffectsForOperation.UpdateOperationId >> EffectsForOperation.SettingsMsg >> EffectsForOperation.composeMsg)
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
                    |> Html.map (EffectsForOperation.UpdateCursor >> EffectsForOperation.SettingsMsg >> EffectsForOperation.composeMsg)
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
                    |> Html.map (EffectsForOperation.UpdateLimit >> EffectsForOperation.SettingsMsg >> EffectsForOperation.composeMsg)
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
                        , onClick (EffectsForOperation.UpdateSorting Sorting.Asc |> EffectsForOperation.SettingsMsg |> EffectsForOperation.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (EffectsForOperation.UpdateSorting Sorting.Desc |> EffectsForOperation.SettingsMsg |> EffectsForOperation.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (EffectsForOperation.Request endpoint model.settings |> EffectsForOperation.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]