module Endpoints.TransactionDetails.Update exposing (update)

import Form.Input as Input

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.TransactionDetails as TransactionDetails

import Msg exposing (Msg)

import Endpoints.TransactionDetails.Msg as TransactionDetails
import Endpoints.TransactionDetails.MsgFactory as TransactionDetails
import Endpoints.TransactionDetails.Model as TransactionDetails


update : TransactionDetails.Msg -> TransactionDetails.Model -> (TransactionDetails.Model, Cmd Msg)
update msg model =

    case msg of
        TransactionDetails.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        TransactionDetails.Request endpoint hash ->
            let
                msg =
                    TransactionDetails.Response >> TransactionDetails.composeMsg

                requestBuilder =
                    TransactionDetails.requestBuilder endpoint hash

            in
                { model | isLoading = True } ! [ TransactionDetails.send msg requestBuilder ]

        TransactionDetails.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error TransactionDetails.Error } ! []

        TransactionDetails.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : TransactionDetails.SettingsMsg -> TransactionDetails.Model -> TransactionDetails.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                TransactionDetails.UpdateHash inputMsg ->
                    { settingsModel | hash = Input.update inputMsg settingsModel.hash }

    in
        { model | settings = newSettingsModel }