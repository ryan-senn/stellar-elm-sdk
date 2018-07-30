module Endpoints.EffectsForLedger.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.EffectsForLedger as EffectsForLedger

import Msg exposing (Msg)

import Endpoints.EffectsForLedger.Msg as EffectsForLedger
import Endpoints.EffectsForLedger.MsgFactory as EffectsForLedger
import Endpoints.EffectsForLedger.Model as EffectsForLedger
import Endpoints.EffectsForLedger.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : EffectsForLedger.Msg -> EffectsForLedger.Model -> (EffectsForLedger.Model, Cmd Msg)
update msg model =

    case msg of
        EffectsForLedger.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        EffectsForLedger.Request endpoint settings ->
            let
                msg =
                    EffectsForLedger.Response >> EffectsForLedger.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ EffectsForLedger.send msg request ]

        EffectsForLedger.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error EffectsForLedger.Error } ! []

        EffectsForLedger.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : EffectsForLedger.SettingsMsg -> EffectsForLedger.Model -> EffectsForLedger.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                EffectsForLedger.UpdateLedgerId intInputMsg ->
                    { settingsModel | ledgerId = IntInput.update intInputMsg settingsModel.ledgerId }

                EffectsForLedger.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                EffectsForLedger.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                EffectsForLedger.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }