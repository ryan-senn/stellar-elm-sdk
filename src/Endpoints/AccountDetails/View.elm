module Endpoints.AccountDetails.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Form.Input as Input

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints

import Endpoints.Styles as Css

import Endpoints.Views.Title as Title
import Endpoints.Views.Endpoint as Endpoint
import Endpoints.Views.Request as Request
import Endpoints.Views.Button as Button
import Endpoints.Views.Response as Response

import Endpoints.AccountDetails.Msg as AccountDetails
import Endpoints.AccountDetails.MsgFactory as AccountDetails
import Endpoints.AccountDetails.Model as AccountDetails

import Stellar.Endpoints.AccountDetails exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> AccountDetails.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Account Details" "https://www.stellar.org/developers/horizon/reference/endpoints/accounts-single.html"
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
                    |> Html.map (AccountDetails.UpdatePublicKey >> AccountDetails.SettingsMsg >> AccountDetails.composeMsg)
                ]
            , Request.view (requestBuilder (endpointFromInput endpoint) (publicKeyFromInput model.settings.publicKey))
            , Button.view model.isLoading (AccountDetails.Request (endpointFromInput endpoint) (publicKeyFromInput model.settings.publicKey) |> AccountDetails.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]