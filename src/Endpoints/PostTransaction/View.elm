module Endpoints.PostTransaction.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Form.Input as Input
import Form.TextArea as TextArea

import Stellar.Sorting as Sorting

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints

import Endpoints.Styles as Css

import Endpoints.Views.Title as Title
import Endpoints.Views.Endpoint as Endpoint
import Endpoints.Views.Request as Request
import Endpoints.Views.Button as Button
import Endpoints.Views.Response as Response

import Endpoints.PostTransaction.Msg as PostTransaction
import Endpoints.PostTransaction.MsgFactory as PostTransaction
import Endpoints.PostTransaction.Model as PostTransaction

import Endpoints.PostTransaction.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput, publicKeyFromInput)


view : Input.Model -> PostTransaction.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Operations for Transaction" "https://www.stellar.org/developers/horizon/reference/endpoints/offers-for-transaction.html"
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
                        [ text "Transaction Envelope Xdr" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: AAAAABbxCy3mLg3hiTqX4VUEEp60pFOrJNxYM1JtxXTwXhY2AAAAZAAAAAMAAAAGAAAAAAAAAAEAAAAAAAAAAQAAAAAAAAAJAAAAAAAAAAHwXhY2AAAAQCPAo8QwsZe9FA0sz/deMdhlu6/zrk7SgkBG22ApvtpETBhnGkX4trSFDz8sVlKqvweqGUVgvjUyM0AcHxyXZQw=)" ]
                    ]
                , model.settings.transactionEnvelopeXdr
                    |> TextArea.view
                    |> TextArea.render
                    |> Html.map (PostTransaction.UpdateTransactionEnvelopeXdr >> PostTransaction.SettingsMsg >> PostTransaction.composeMsg)
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (PostTransaction.Request endpoint model.settings |> PostTransaction.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]