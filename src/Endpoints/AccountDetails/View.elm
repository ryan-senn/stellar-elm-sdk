module Endpoints.AccountDetails.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Form.Input as Input

import Stellar.Endpoint as Endpoint
import Stellar.PublicKey as PublicKey

import Msg exposing (Msg)

import RequestBuilderPresenter

import Styles as Css
import Helpers.Html.Attributes exposing ((?))

import Endpoints.Msg as Endpoints
import Endpoints.View exposing (pageTitle, response)

import Endpoints.AccountDetails.Msg as AccountDetails
import Endpoints.AccountDetails.MsgFactory as AccountDetails
import Endpoints.AccountDetails.Model as AccountDetails

import Stellar.Endpoints.AccountDetails exposing (requestBuilder)


view : AccountDetails.Model -> Html Msg
view model =
    div
        []
        [ pageTitle "Account Details" "https://www.stellar.org/developers/horizon/reference/endpoints/accounts-single.html"
        , div
            [ Css.page ]
            [ div
                [ class "form-group" ]
                [ label
                    []
                    [ text "Public Key" ]
                , model.publicKey
                    |> Input.view
                    |> Input.render
                    |> Html.fromUnstyled
                    |> Html.map (AccountDetails.UpdatePublicKey >> AccountDetails.composeMsg)
                ]
            , RequestBuilderPresenter.view (requestBuilder Endpoint.dummy (Input.getValue model.publicKey |> PublicKey.fromString))
            , button
                [ Css.requestButton model.isLoading
                , onClick (AccountDetails.Request Endpoint.dummy (Input.getValue model.publicKey |> PublicKey.fromString) |> AccountDetails.composeMsg) ? not model.isLoading ]
                [ text "Submit Request" ]
            , response model.response
            ]
        ]