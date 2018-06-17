module Endpoints.LedgerDetails.View exposing (view)

import Html.Styled as Html exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)

import Form.Input as Input
import Form.IntInput as IntInput

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints

import Endpoints.Styles as Css

import Endpoints.Views.Title as Title
import Endpoints.Views.Endpoint as Endpoint
import Endpoints.Views.Request as Request
import Endpoints.Views.Button as Button
import Endpoints.Views.Response as Response

import Endpoints.LedgerDetails.Msg as LedgerDetails
import Endpoints.LedgerDetails.MsgFactory as LedgerDetails
import Endpoints.LedgerDetails.Model as LedgerDetails

import Stellar.Endpoints.LedgerDetails exposing (requestBuilder)

import Endpoints.Helpers exposing (endpointFromInput)


view : Input.Model -> LedgerDetails.Model -> Html Msg
view endpoint model =

    div
        []
        [ Title.view "Ledger Details" "https://www.stellar.org/developers/horizon/reference/endpoints/accounts-single.html"
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
                        [ text "Sequence" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 69859)" ]
                    ]
                , model.settings.sequence
                    |> IntInput.view
                    |> IntInput.render
                    |> Html.fromUnstyled
                    |> Html.map (LedgerDetails.UpdateSequence >> LedgerDetails.SettingsMsg >> LedgerDetails.composeMsg)
                ]
            , Request.view (requestBuilder (endpointFromInput endpoint) (IntInput.getValue model.settings.sequence |> Maybe.withDefault 0))
            , Button.view model.isLoading (LedgerDetails.Request (endpointFromInput endpoint) (IntInput.getValue model.settings.sequence |> Maybe.withDefault 0) |> LedgerDetails.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]