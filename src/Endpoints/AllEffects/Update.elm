module Endpoints.AllEffects.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.AllEffects as AllEffects

import Msg exposing (Msg)

import Endpoints.AllEffects.Msg as AllEffects
import Endpoints.AllEffects.MsgFactory as AllEffects
import Endpoints.AllEffects.Model as AllEffects
import Endpoints.AllEffects.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : AllEffects.Msg -> AllEffects.Model -> (AllEffects.Model, Cmd Msg)
update msg model =

    case msg of
        AllEffects.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        AllEffects.Request endpoint settings ->
            let
                msg =
                    AllEffects.Response >> AllEffects.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ AllEffects.send msg request ]

        AllEffects.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error AllEffects.Error } ! []

        AllEffects.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : AllEffects.SettingsMsg -> AllEffects.Model -> AllEffects.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                AllEffects.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                AllEffects.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                AllEffects.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }