module Endpoints.TransactionDetails.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Form.Input as Input
import Form.Input as Input

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints

import Endpoints.Styles as Css

import Endpoints.Views.Title as Title
import Endpoints.Views.Endpoint as Endpoint
import Endpoints.Views.Request as Request
import Endpoints.Views.Button as Button
import Endpoints.Views.Response as Response

import Endpoints.TransactionDetails.Msg as TransactionDetails
import Endpoints.TransactionDetails.MsgFactory as TransactionDetails
import Endpoints.TransactionDetails.Model as TransactionDetails

import Stellar.Endpoints.TransactionDetails exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput)


view : Input.Model -> TransactionDetails.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Transaction Details" "https://www.stellar.org/developers/horizon/reference/endpoints/accounts-single.html"
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
                , model.settings.hash
                    |> Input.view
                    |> Input.render
                    |> Html.map (TransactionDetails.UpdateHash >> TransactionDetails.SettingsMsg >> TransactionDetails.composeMsg)
                ]
            , Request.view (requestBuilder (endpointFromInput endpoint) (Input.getValue model.settings.hash))
            , Button.view model.isLoading (TransactionDetails.Request (endpointFromInput endpoint) (Input.getValue model.settings.hash) |> TransactionDetails.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]