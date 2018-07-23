module Endpoints.PaymentsForLedger.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.PaymentsForLedger as PaymentsForLedger

import Msg exposing (Msg)

import Endpoints.PaymentsForLedger.Msg as PaymentsForLedger
import Endpoints.PaymentsForLedger.MsgFactory as PaymentsForLedger
import Endpoints.PaymentsForLedger.Model as PaymentsForLedger
import Endpoints.PaymentsForLedger.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : PaymentsForLedger.Msg -> PaymentsForLedger.Model -> (PaymentsForLedger.Model, Cmd Msg)
update msg model =

    case msg of
        PaymentsForLedger.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        PaymentsForLedger.Request endpoint settings ->
            let
                msg =
                    PaymentsForLedger.Response >> PaymentsForLedger.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ PaymentsForLedger.send msg request ]

        PaymentsForLedger.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error PaymentsForLedger.Error } ! []

        PaymentsForLedger.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : PaymentsForLedger.SettingsMsg -> PaymentsForLedger.Model -> PaymentsForLedger.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                PaymentsForLedger.UpdateLedgerId intInputMsg ->
                    { settingsModel | ledgerId = IntInput.update intInputMsg settingsModel.ledgerId }

                PaymentsForLedger.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                PaymentsForLedger.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                PaymentsForLedger.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }