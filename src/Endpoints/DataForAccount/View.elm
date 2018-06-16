module Endpoints.DataForAccount.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Form.Input as Input
import Form.Select as Select

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints

import Endpoints.Styles as Css

import Endpoints.Views.Title as Title
import Endpoints.Views.Endpoint as Endpoint
import Endpoints.Views.Request as Request
import Endpoints.Views.Button as Button
import Endpoints.Views.Response as Response

import Endpoints.DataForAccount.Msg as DataForAccount
import Endpoints.DataForAccount.MsgFactory as DataForAccount
import Endpoints.DataForAccount.Model as DataForAccount

import Stellar.Endpoints.DataForAccount exposing (requestBuilder, DataKey (UserId))

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> DataForAccount.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Data for Account" "https://www.stellar.org/developers/horizon/reference/endpoints/data-for-account.html"
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
                        [ text "Public Key" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: GA2HGBJIJKI6O4XEM7CZWY5PS6GKSXL6D34ERAJYQSPYA6X6AI7HYW36)" ]
                    ]
                , model.settings.publicKey
                    |> Input.view
                    |> Input.render
                    |> Html.fromUnstyled
                    |> Html.map (DataForAccount.UpdatePublicKey >> DataForAccount.SettingsMsg >> DataForAccount.composeMsg)
                ]
            , div
                [ class "form-group" ]
                [ label
                    [ Css.label ]
                    [ span
                        [ Css.labelMandatory ]
                        [ text "Data Key" ]
                    ]
                , model.settings.dataKey
                    |> Select.view
                    |> Select.render
                    |> Html.fromUnstyled
                    |> Html.map (DataForAccount.UpdateDataKey >> DataForAccount.SettingsMsg >> DataForAccount.composeMsg)
                ]
            , Request.view (
                requestBuilder
                    (endpointFromInput endpoint)
                    (publicKeyFromInput model.settings.publicKey)
                    (Select.getSelectedOption model.settings.dataKey |> Maybe.withDefault UserId)
                )
            , Button.view
                model.isLoading (
                    DataForAccount.Request
                        (endpointFromInput endpoint)
                        (publicKeyFromInput model.settings.publicKey)
                        (Select.getSelectedOption model.settings.dataKey |> Maybe.withDefault UserId)
                        |> DataForAccount.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]