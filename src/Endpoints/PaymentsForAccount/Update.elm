module Endpoints.PaymentsForAccount.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.PaymentsForAccount as PaymentsForAccount

import Msg exposing (Msg)

import Endpoints.PaymentsForAccount.Msg as PaymentsForAccount
import Endpoints.PaymentsForAccount.MsgFactory as PaymentsForAccount
import Endpoints.PaymentsForAccount.Model as PaymentsForAccount
import Endpoints.PaymentsForAccount.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : PaymentsForAccount.Msg -> PaymentsForAccount.Model -> (PaymentsForAccount.Model, Cmd Msg)
update msg model =

    case msg of
        PaymentsForAccount.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        PaymentsForAccount.Request endpoint settings ->
            let
                msg =
                    PaymentsForAccount.Response >> PaymentsForAccount.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ PaymentsForAccount.send msg request ]

        PaymentsForAccount.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error PaymentsForAccount.Error } ! []

        PaymentsForAccount.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : PaymentsForAccount.SettingsMsg -> PaymentsForAccount.Model -> PaymentsForAccount.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                PaymentsForAccount.UpdateAccount inputMsg ->
                    { settingsModel | account = Input.update inputMsg settingsModel.account }

                PaymentsForAccount.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                PaymentsForAccount.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                PaymentsForAccount.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }