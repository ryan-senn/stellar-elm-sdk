module Endpoints.AllLedgers.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.AllLedgers as AllLedgers

import Msg exposing (Msg)

import Endpoints.AllLedgers.Msg as AllLedgers
import Endpoints.AllLedgers.MsgFactory as AllLedgers
import Endpoints.AllLedgers.Model as AllLedgers
import Endpoints.AllLedgers.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : AllLedgers.Msg -> AllLedgers.Model -> (AllLedgers.Model, Cmd Msg)
update msg model =

    case msg of
        AllLedgers.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        AllLedgers.Request endpoint settings ->
            let
                msg =
                    AllLedgers.Response >> AllLedgers.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ AllLedgers.send msg request ]

        AllLedgers.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error AllLedgers.Error } ! []

        AllLedgers.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : AllLedgers.SettingsMsg -> AllLedgers.Model -> AllLedgers.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                AllLedgers.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                AllLedgers.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                AllLedgers.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }