module Endpoints.FindPaymentPaths.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Html.Styled.Bdt as Html

import Form.Input as Input
import Form.IntInput as IntInput
import Form.Select as Select

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints

import Endpoints.Styles as Css

import Endpoints.Views.Title as Title
import Endpoints.Views.Endpoint as Endpoint
import Endpoints.Views.Request as Request
import Endpoints.Views.Button as Button
import Endpoints.Views.Response as Response

import Endpoints.FindPaymentPaths.Msg as FindPaymentPaths
import Endpoints.FindPaymentPaths.MsgFactory as FindPaymentPaths
import Endpoints.FindPaymentPaths.Model as FindPaymentPaths
import Endpoints.FindPaymentPaths.RequestBuilder exposing (requestBuilder)


view : Input.Model -> FindPaymentPaths.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Operation Details" "https://www.stellar.org/developers/horizon/reference/endpoints/operations-single.html"
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
                        [ text "Source Account" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: GA2HGBJIJKI6O4XEM7CZWY5PS6GKSXL6D34ERAJYQSPYA6X6AI7HYW36)" ]
                    ]
                , model.settings.sourceAccount
                    |> Input.view
                    |> Input.render
                    |> Html.map (FindPaymentPaths.UpdateSourceAccount >> FindPaymentPaths.SettingsMsg >> FindPaymentPaths.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        [ Css.labelMandatory ]
                        [ text "Destination Account" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: GA2HGBJIJKI6O4XEM7CZWY5PS6GKSXL6D34ERAJYQSPYA6X6AI7HYW36)" ]
                    ]
                , model.settings.destinationAccount
                    |> Input.view
                    |> Input.render
                    |> Html.map (FindPaymentPaths.UpdateDestinationAccount >> FindPaymentPaths.SettingsMsg >> FindPaymentPaths.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        [ Css.labelMandatory ]
                        [ text "Destination Asset Type" ]
                    , span
                        []
                        []
                    ]
                , model.settings.destinationAssetType
                    |> Select.view
                    |> Select.render
                    |> Html.map (FindPaymentPaths.UpdateDestinationAssetType >> FindPaymentPaths.SettingsMsg >> FindPaymentPaths.composeMsg)
                ]
            , Html.divIf (Select.getSelectedOption model.settings.destinationAssetType /= Nothing && Select.getSelectedOption model.settings.destinationAssetType /= Just AssetType.Native)
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Destination Asset Code" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: USD)" ]
                    ]
                , model.settings.destinationAssetCode
                    |> Input.view
                    |> Input.render
                    |> Html.map (FindPaymentPaths.UpdateDestinationAssetCode >> FindPaymentPaths.SettingsMsg >> FindPaymentPaths.composeMsg)
                ]
            , Html.divIf (Select.getSelectedOption model.settings.destinationAssetType /= Nothing && Select.getSelectedOption model.settings.destinationAssetType /= Just AssetType.Native)
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        []
                        [ text "Destination Asset Issuer" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: GA2HGBJIJKI6O4XEM7CZWY5PS6GKSXL6D34ERAJYQSPYA6X6AI7HYW36)" ]
                    ]
                , model.settings.destinationAssetIssuer
                    |> Input.view
                    |> Input.render
                    |> Html.map (FindPaymentPaths.UpdateDestinationAssetIssuer >> FindPaymentPaths.SettingsMsg >> FindPaymentPaths.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        [ Css.labelMandatory ]
                        [ text "Destination Amount" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: GA2HGBJIJKI6O4XEM7CZWY5PS6GKSXL6D34ERAJYQSPYA6X6AI7HYW36)" ]
                    ]
                , model.settings.destinationAmount
                    |> IntInput.view
                    |> IntInput.render
                    |> Html.map (FindPaymentPaths.UpdateDestinationAccount >> FindPaymentPaths.SettingsMsg >> FindPaymentPaths.composeMsg)
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (FindPaymentPaths.Request endpoint model.settings |> FindPaymentPaths.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]