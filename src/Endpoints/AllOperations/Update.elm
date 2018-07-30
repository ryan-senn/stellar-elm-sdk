module Endpoints.AllOperations.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.AllOperations as AllOperations

import Msg exposing (Msg)

import Endpoints.AllOperations.Msg as AllOperations
import Endpoints.AllOperations.MsgFactory as AllOperations
import Endpoints.AllOperations.Model as AllOperations
import Endpoints.AllOperations.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : AllOperations.Msg -> AllOperations.Model -> (AllOperations.Model, Cmd Msg)
update msg model =

    case msg of
        AllOperations.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        AllOperations.Request endpoint settings ->
            let
                msg =
                    AllOperations.Response >> AllOperations.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ AllOperations.send msg request ]

        AllOperations.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error AllOperations.Error } ! []

        AllOperations.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : AllOperations.SettingsMsg -> AllOperations.Model -> AllOperations.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                AllOperations.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                AllOperations.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                AllOperations.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }