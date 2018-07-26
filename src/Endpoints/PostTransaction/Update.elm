module Endpoints.PostTransaction.Update exposing (update)

import Form.Input as Input
import Form.TextArea as TextArea

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.PostTransaction as PostTransaction

import Msg exposing (Msg)

import Endpoints.PostTransaction.Msg as PostTransaction
import Endpoints.PostTransaction.MsgFactory as PostTransaction
import Endpoints.PostTransaction.Model as PostTransaction
import Endpoints.PostTransaction.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : PostTransaction.Msg -> PostTransaction.Model -> (PostTransaction.Model, Cmd Msg)
update msg model =

    case msg of
        PostTransaction.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model

        PostTransaction.Request endpoint settings ->
            let
                msg =
                    PostTransaction.Response >> PostTransaction.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ PostTransaction.send msg request ]

        PostTransaction.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error PostTransaction.Error } ! []

        PostTransaction.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : PostTransaction.SettingsMsg -> PostTransaction.Model -> (PostTransaction.Model, Cmd Msg)
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        (newSettingsModel, cmds) =
            case updateSettingsMsg of
                PostTransaction.UpdateTransactionEnvelopeXdr textAreaMsg ->
                    { settingsModel | transactionEnvelopeXdr = TextArea.update textAreaMsg settingsModel.transactionEnvelopeXdr } ! []

    in
        { model | settings = newSettingsModel } ! [ cmds ]