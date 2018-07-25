module Endpoints.TransactionsForLedger.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.TransactionsForLedger as TransactionsForLedger

import Msg exposing (Msg)

import Endpoints.TransactionsForLedger.Msg as TransactionsForLedger
import Endpoints.TransactionsForLedger.MsgFactory as TransactionsForLedger
import Endpoints.TransactionsForLedger.Model as TransactionsForLedger
import Endpoints.TransactionsForLedger.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : TransactionsForLedger.Msg -> TransactionsForLedger.Model -> (TransactionsForLedger.Model, Cmd Msg)
update msg model =

    case msg of
        TransactionsForLedger.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        TransactionsForLedger.Request endpoint settings ->
            let
                msg =
                    TransactionsForLedger.Response >> TransactionsForLedger.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ TransactionsForLedger.send msg request ]

        TransactionsForLedger.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error TransactionsForLedger.Error } ! []

        TransactionsForLedger.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : TransactionsForLedger.SettingsMsg -> TransactionsForLedger.Model -> TransactionsForLedger.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                TransactionsForLedger.UpdateLedgerId intInputMsg ->
                    { settingsModel | ledgerId = IntInput.update intInputMsg settingsModel.ledgerId }

                TransactionsForLedger.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                TransactionsForLedger.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                TransactionsForLedger.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }