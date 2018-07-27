module Endpoints.AllAssets.View exposing (view)

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

import Endpoints.AllAssets.Msg as AllAssets
import Endpoints.AllAssets.MsgFactory as AllAssets
import Endpoints.AllAssets.Model as AllAssets

import Endpoints.AllAssets.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> AllAssets.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "All Assets" "https://www.stellar.org/developers/horizon/reference/endpoints/assets-all.html"
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
                        [ text "Asset Code" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: USD)" ]
                    ]
                , model.settings.assetCode
                    |> Input.view
                    |> Input.render
                    |> Html.map (AllAssets.UpdateAssetCode >> AllAssets.SettingsMsg >> AllAssets.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Asset Issuer" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: GA2HGBJIJKI6O4XEM7CZWY5PS6GKSXL6D34ERAJYQSPYA6X6AI7HYW36)" ]
                    ]
                , model.settings.assetIssuer
                    |> Input.view
                    |> Input.render
                    |> Html.map (AllAssets.UpdateAssetIssuer >> AllAssets.SettingsMsg >> AllAssets.composeMsg)
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
                    |> Html.map (AllAssets.UpdateCursor >> AllAssets.SettingsMsg >> AllAssets.composeMsg)
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
                    |> Html.map (AllAssets.UpdateLimit >> AllAssets.SettingsMsg >> AllAssets.composeMsg)
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
                        , onClick (AllAssets.UpdateSorting Sorting.Asc |> AllAssets.SettingsMsg |> AllAssets.composeMsg)
                        ]
                        [ text "Asc" ]
                    , span
                        [ Css.radioButton (model.settings.sorting == Just Sorting.Desc)
                        , onClick (AllAssets.UpdateSorting Sorting.Desc |> AllAssets.SettingsMsg |> AllAssets.composeMsg)
                        ]
                        [ text "Desc" ]
                    ]
                ]
            , Request.view (requestBuilder (endpointFromInput endpoint) model.settings)
            , Button.view model.isLoading (AllAssets.Request (endpointFromInput endpoint) model.settings |> AllAssets.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]