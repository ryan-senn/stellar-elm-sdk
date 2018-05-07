module Endpoints.AccountDetails.View exposing (view)

import Html
import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Stellar.Endpoint as Endpoint
import Stellar.PublicKey as PublicKey

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.View exposing (pageTitle, response)
import Endpoints.Styles as S

import Endpoints.AccountDetails.Msg as AccountDetails
import Endpoints.AccountDetails.MsgFactory as AccountDetails
import Endpoints.AccountDetails.Model as AccountDetails


view : AccountDetails.Model -> Html Msg
view model =
    div
        []
        [ pageTitle "Account Details" "https://www.stellar.org/developers/horizon/reference/endpoints/accounts-single.html"
        , div
            [ S.page ]
            [ button
                [ onClick (AccountDetails.Request Endpoint.dummy PublicKey.dummy |> AccountDetails.composeMsg) ]
                [ text "Request" ]
            , h4
                []
                [ text "response" ]
            , response model.response
            ]
        ]