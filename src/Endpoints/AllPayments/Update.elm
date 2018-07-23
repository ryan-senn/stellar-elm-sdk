module Endpoints.AllPayments.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.AllPayments as AllPayments

import Msg exposing (Msg)

import Endpoints.AllPayments.Msg as AllPayments
import Endpoints.AllPayments.MsgFactory as AllPayments
import Endpoints.AllPayments.Model as AllPayments
import Endpoints.AllPayments.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : AllPayments.Msg -> AllPayments.Model -> (AllPayments.Model, Cmd Msg)
update msg model =

    case msg of
        AllPayments.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        AllPayments.Request endpoint settings ->
            let
                msg =
                    AllPayments.Response >> AllPayments.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ AllPayments.send msg request ]

        AllPayments.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error AllPayments.Error } ! []

        AllPayments.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : AllPayments.SettingsMsg -> AllPayments.Model -> AllPayments.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                AllPayments.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                AllPayments.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                AllPayments.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }