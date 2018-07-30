module Endpoints.PaymentsForTransaction.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.PaymentsForTransaction as PaymentsForTransaction

import Msg exposing (Msg)

import Endpoints.PaymentsForTransaction.Msg as PaymentsForTransaction
import Endpoints.PaymentsForTransaction.MsgFactory as PaymentsForTransaction
import Endpoints.PaymentsForTransaction.Model as PaymentsForTransaction
import Endpoints.PaymentsForTransaction.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : PaymentsForTransaction.Msg -> PaymentsForTransaction.Model -> (PaymentsForTransaction.Model, Cmd Msg)
update msg model =

    case msg of
        PaymentsForTransaction.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        PaymentsForTransaction.Request endpoint settings ->
            let
                msg =
                    PaymentsForTransaction.Response >> PaymentsForTransaction.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ PaymentsForTransaction.send msg request ]

        PaymentsForTransaction.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error PaymentsForTransaction.Error } ! []

        PaymentsForTransaction.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : PaymentsForTransaction.SettingsMsg -> PaymentsForTransaction.Model -> PaymentsForTransaction.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                PaymentsForTransaction.UpdateTransaction inputMsg ->
                    { settingsModel | transaction = Input.update inputMsg settingsModel.transaction }

                PaymentsForTransaction.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                PaymentsForTransaction.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                PaymentsForTransaction.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }