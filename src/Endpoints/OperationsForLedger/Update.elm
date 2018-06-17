module Endpoints.OperationsForLedger.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.OperationsForLedger as OperationsForLedger

import Msg exposing (Msg)

import Endpoints.OperationsForLedger.Msg as OperationsForLedger
import Endpoints.OperationsForLedger.MsgFactory as OperationsForLedger
import Endpoints.OperationsForLedger.Model as OperationsForLedger
import Endpoints.OperationsForLedger.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : OperationsForLedger.Msg -> OperationsForLedger.Model -> (OperationsForLedger.Model, Cmd Msg)
update msg model =

    case msg of
        OperationsForLedger.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        OperationsForLedger.Request endpoint settings ->
            let
                msg =
                    OperationsForLedger.Response >> OperationsForLedger.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ OperationsForLedger.send msg request ]

        OperationsForLedger.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error OperationsForLedger.Error } ! []

        OperationsForLedger.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : OperationsForLedger.SettingsMsg -> OperationsForLedger.Model -> OperationsForLedger.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                OperationsForLedger.UpdateLedgerId intInputMsg ->
                    { settingsModel | ledgerId = IntInput.update intInputMsg settingsModel.ledgerId }

                OperationsForLedger.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                OperationsForLedger.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                OperationsForLedger.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }