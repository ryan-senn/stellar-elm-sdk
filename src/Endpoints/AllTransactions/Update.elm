module Endpoints.AllTransactions.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.AllTransactions as AllTransactions

import Msg exposing (Msg)

import Endpoints.AllTransactions.Msg as AllTransactions
import Endpoints.AllTransactions.MsgFactory as AllTransactions
import Endpoints.AllTransactions.Model as AllTransactions
import Endpoints.AllTransactions.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : AllTransactions.Msg -> AllTransactions.Model -> (AllTransactions.Model, Cmd Msg)
update msg model =

    case msg of
        AllTransactions.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        AllTransactions.Request endpoint settings ->
            let
                msg =
                    AllTransactions.Response >> AllTransactions.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ AllTransactions.send msg request ]

        AllTransactions.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error AllTransactions.Error } ! []

        AllTransactions.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : AllTransactions.SettingsMsg -> AllTransactions.Model -> AllTransactions.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                AllTransactions.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                AllTransactions.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                AllTransactions.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }