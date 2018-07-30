module Endpoints.EffectsForAccount.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.EffectsForAccount as EffectsForAccount

import Msg exposing (Msg)

import Endpoints.EffectsForAccount.Msg as EffectsForAccount
import Endpoints.EffectsForAccount.MsgFactory as EffectsForAccount
import Endpoints.EffectsForAccount.Model as EffectsForAccount
import Endpoints.EffectsForAccount.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : EffectsForAccount.Msg -> EffectsForAccount.Model -> (EffectsForAccount.Model, Cmd Msg)
update msg model =

    case msg of
        EffectsForAccount.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        EffectsForAccount.Request endpoint settings ->
            let
                msg =
                    EffectsForAccount.Response >> EffectsForAccount.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ EffectsForAccount.send msg request ]

        EffectsForAccount.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error EffectsForAccount.Error } ! []

        EffectsForAccount.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : EffectsForAccount.SettingsMsg -> EffectsForAccount.Model -> EffectsForAccount.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                EffectsForAccount.UpdateAccount inputMsg ->
                    { settingsModel | account = Input.update inputMsg settingsModel.account }

                EffectsForAccount.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                EffectsForAccount.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                EffectsForAccount.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }