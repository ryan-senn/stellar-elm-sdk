module Endpoints.LedgerDetails.Update exposing (update)

import Form.IntInput as IntInput

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.LedgerDetails as LedgerDetails

import Msg exposing (Msg)

import Endpoints.LedgerDetails.Msg as LedgerDetails
import Endpoints.LedgerDetails.MsgFactory as LedgerDetails
import Endpoints.LedgerDetails.Model as LedgerDetails


update : LedgerDetails.Msg -> LedgerDetails.Model -> (LedgerDetails.Model, Cmd Msg)
update msg model =

    case msg of
        LedgerDetails.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        LedgerDetails.Request endpoint sequence ->
            let
                msg =
                    LedgerDetails.Response >> LedgerDetails.composeMsg

                requestBuilder =
                    LedgerDetails.requestBuilder endpoint sequence

            in
                { model | isLoading = True } ! [ LedgerDetails.send msg requestBuilder ]

        LedgerDetails.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error LedgerDetails.Error } ! []

        LedgerDetails.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : LedgerDetails.SettingsMsg -> LedgerDetails.Model -> LedgerDetails.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                LedgerDetails.UpdateSequence inputMsg ->
                    { settingsModel | sequence = IntInput.update inputMsg settingsModel.sequence }

    in
        { model | settings = newSettingsModel }