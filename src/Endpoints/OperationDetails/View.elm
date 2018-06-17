module Endpoints.OperationDetails.View exposing (view)

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

import Endpoints.OperationDetails.Msg as OperationDetails
import Endpoints.OperationDetails.MsgFactory as OperationDetails
import Endpoints.OperationDetails.Model as OperationDetails
import Endpoints.OperationDetails.RequestBuilder exposing (requestBuilder)


view : Input.Model -> OperationDetails.Model -> Html Msg
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
                        [ text "Operation Id" ]
                    , span
                        [ Css.labelExample ]
                        [ text "(eg: 77309415424)" ]
                    ]
                , model.settings.operationId
                    |> IntInput.view
                    |> IntInput.render
                    |> Html.fromUnstyled
                    |> Html.map (OperationDetails.UpdatePublicKey >> OperationDetails.SettingsMsg >> OperationDetails.composeMsg)
                ]
            , Request.view (requestBuilder endpoint model.settings)
            , Button.view model.isLoading (OperationDetails.Request endpoint model.settings |> OperationDetails.composeMsg)
            , Response.view model.response model.isLoading
            ]
        ]