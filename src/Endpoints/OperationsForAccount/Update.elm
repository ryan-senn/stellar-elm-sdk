module Endpoints.OperationsForAccount.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.OperationsForAccount as OperationsForAccount

import Msg exposing (Msg)

import Endpoints.OperationsForAccount.Msg as OperationsForAccount
import Endpoints.OperationsForAccount.MsgFactory as OperationsForAccount
import Endpoints.OperationsForAccount.Model as OperationsForAccount
import Endpoints.OperationsForAccount.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : OperationsForAccount.Msg -> OperationsForAccount.Model -> (OperationsForAccount.Model, Cmd Msg)
update msg model =

    case msg of
        OperationsForAccount.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        OperationsForAccount.Request endpoint settings ->
            let
                msg =
                    OperationsForAccount.Response >> OperationsForAccount.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ OperationsForAccount.send msg request ]

        OperationsForAccount.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error OperationsForAccount.Error } ! []

        OperationsForAccount.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : OperationsForAccount.SettingsMsg -> OperationsForAccount.Model -> OperationsForAccount.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                OperationsForAccount.UpdateAccount inputMsg ->
                    { settingsModel | account = Input.update inputMsg settingsModel.account }

                OperationsForAccount.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                OperationsForAccount.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                OperationsForAccount.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }