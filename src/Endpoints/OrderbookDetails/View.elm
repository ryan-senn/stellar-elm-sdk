module Endpoints.OrderbookDetails.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Html.Styled.Bdt as Html

import Form.Input as Input
import Form.IntInput as IntInput
import Form.Select as Select

import Stellar.AssetType as AssetType
import Stellar.Sorting as Sorting

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints

import Endpoints.Styles as Css

import Endpoints.Views.Title as Title
import Endpoints.Views.Endpoint as Endpoint
import Endpoints.Views.Request as Request
import Endpoints.Views.Button as Button
import Endpoints.Views.Response as Response

import Endpoints.OrderbookDetails.Msg as OrderbookDetails
import Endpoints.OrderbookDetails.MsgFactory as OrderbookDetails
import Endpoints.OrderbookDetails.Model as OrderbookDetails

import Endpoints.OrderbookDetails.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> OrderbookDetails.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Orderbook Details" "https://www.stellar.org/developers/horizon/reference/endpoints/offers-for-transaction.html"
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
                        [ text "Selling Asset Type" ]
                    , span
                        []
                        []
                    ]
                , model.settings.sellingAssetType
                    |> Select.view
                    |> Select.render
                    |> Html.map (OrderbookDetails.UpdateSellingAssetType >> OrderbookDetails.SettingsMsg >> OrderbookDetails.composeMsg)
                ]
            , Html.divIf (Select.getSelectedOption model.settings.sellingAssetType /= Nothing && Select.getSelectedOption model.settings.sellingAssetType /= Just AssetType.Native)
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Selling Asset Code" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: USD)" ]
                    ]
                , model.settings.sellingAssetCode
                    |> Input.view
                    |> Input.render
                    |> Html.map (OrderbookDetails.UpdateSellingAssetCode >> OrderbookDetails.SettingsMsg >> OrderbookDetails.composeMsg)
                ]
            , Html.divIf (Select.getSelectedOption model.settings.sellingAssetType /= Nothing && Select.getSelectedOption model.settings.sellingAssetType /= Just AssetType.Native)
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Selling Asset Issuer" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: GA2HGBJIJKI6O4XEM7CZWY5PS6GKSXL6D34ERAJYQSPYA6X6AI7HYW36)" ]
                    ]
                , model.settings.sellingAssetIssuer
                    |> Input.view
                    |> Input.render
                    |> Html.map (OrderbookDetails.UpdateSellingAssetIssuer >> OrderbookDetails.SettingsMsg >> OrderbookDetails.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        [ Css.labelMandatory ]
                        [ text "Buying Asset Type" ]
                    , span
                        []
                        []
                    ]
                , model.settings.buyingAssetType
                    |> Select.view
                    |> Select.render
                    |> Html.map (OrderbookDetails.UpdateBuyingAssetType >> OrderbookDetails.SettingsMsg >> OrderbookDetails.composeMsg)
                ]
            , Html.divIf (Select.getSelectedOption model.settings.buyingAssetType /= Nothing && Select.getSelectedOption model.settings.buyingAssetType /= Just AssetType.Native)
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Buying Asset Code" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: USD)" ]
                    ]
                , model.settings.buyingAssetCode
                    |> Input.view
                    |> Input.render
                    |> Html.map (OrderbookDetails.UpdateBuyingAssetCode >> OrderbookDetails.SettingsMsg >> OrderbookDetails.composeMsg)
                ]
            , Html.divIf (Select.getSelectedOption model.settings.buyingAssetType /= Nothing && Select.getSelectedOption model.settings.buyingAssetType /= Just AssetType.Native)
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Buying Asset Issuer" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: GA2HGBJIJKI6O4XEM7CZWY5PS6GKSXL6D34ERAJYQSPYA6X6AI7HYW36)" ]
                    ]
                , model.settings.buyingAssetIssuer
                    |> Input.view
                    |> Input.render
                    |> Html.map (OrderbookDetails.UpdateBuyingAssetIssuer >> OrderbookDetails.SettingsMsg >> OrderbookDetails.composeMsg)
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
                    |> Html.map (OrderbookDetails.UpdateLimit >> OrderbookDetails.SettingsMsg >> OrderbookDetails.composeMsg)
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (OrderbookDetails.Request endpoint model.settings |> OrderbookDetails.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]