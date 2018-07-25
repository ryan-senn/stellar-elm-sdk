module Endpoints.TransactionsForAccount.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.TransactionsForAccount as TransactionsForAccount

import Msg exposing (Msg)

import Endpoints.TransactionsForAccount.Msg as TransactionsForAccount
import Endpoints.TransactionsForAccount.MsgFactory as TransactionsForAccount
import Endpoints.TransactionsForAccount.Model as TransactionsForAccount
import Endpoints.TransactionsForAccount.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : TransactionsForAccount.Msg -> TransactionsForAccount.Model -> (TransactionsForAccount.Model, Cmd Msg)
update msg model =

    case msg of
        TransactionsForAccount.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        TransactionsForAccount.Request endpoint settings ->
            let
                msg =
                    TransactionsForAccount.Response >> TransactionsForAccount.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ TransactionsForAccount.send msg request ]

        TransactionsForAccount.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error TransactionsForAccount.Error } ! []

        TransactionsForAccount.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : TransactionsForAccount.SettingsMsg -> TransactionsForAccount.Model -> TransactionsForAccount.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                TransactionsForAccount.UpdateAccount inputMsg ->
                    { settingsModel | account = Input.update inputMsg settingsModel.account }

                TransactionsForAccount.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                TransactionsForAccount.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                TransactionsForAccount.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }