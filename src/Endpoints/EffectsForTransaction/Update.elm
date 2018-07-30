module Endpoints.EffectsForTransaction.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.EffectsForTransaction as EffectsForTransaction

import Msg exposing (Msg)

import Endpoints.EffectsForTransaction.Msg as EffectsForTransaction
import Endpoints.EffectsForTransaction.MsgFactory as EffectsForTransaction
import Endpoints.EffectsForTransaction.Model as EffectsForTransaction
import Endpoints.EffectsForTransaction.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : EffectsForTransaction.Msg -> EffectsForTransaction.Model -> (EffectsForTransaction.Model, Cmd Msg)
update msg model =

    case msg of
        EffectsForTransaction.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        EffectsForTransaction.Request endpoint settings ->
            let
                msg =
                    EffectsForTransaction.Response >> EffectsForTransaction.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ EffectsForTransaction.send msg request ]

        EffectsForTransaction.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error EffectsForTransaction.Error } ! []

        EffectsForTransaction.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : EffectsForTransaction.SettingsMsg -> EffectsForTransaction.Model -> EffectsForTransaction.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                EffectsForTransaction.UpdateTransaction inputMsg ->
                    { settingsModel | transaction = Input.update inputMsg settingsModel.transaction }

                EffectsForTransaction.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                EffectsForTransaction.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                EffectsForTransaction.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }