module Endpoints.EffectsForOperation.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.EffectsForOperation as EffectsForOperation

import Msg exposing (Msg)

import Endpoints.EffectsForOperation.Msg as EffectsForOperation
import Endpoints.EffectsForOperation.MsgFactory as EffectsForOperation
import Endpoints.EffectsForOperation.Model as EffectsForOperation
import Endpoints.EffectsForOperation.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : EffectsForOperation.Msg -> EffectsForOperation.Model -> (EffectsForOperation.Model, Cmd Msg)
update msg model =

    case msg of
        EffectsForOperation.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        EffectsForOperation.Request endpoint settings ->
            let
                msg =
                    EffectsForOperation.Response >> EffectsForOperation.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ EffectsForOperation.send msg request ]

        EffectsForOperation.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error EffectsForOperation.Error } ! []

        EffectsForOperation.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : EffectsForOperation.SettingsMsg -> EffectsForOperation.Model -> EffectsForOperation.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                EffectsForOperation.UpdateOperationId intInputMsg ->
                    { settingsModel | operationId = IntInput.update intInputMsg settingsModel.operationId }

                EffectsForOperation.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                EffectsForOperation.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                EffectsForOperation.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }