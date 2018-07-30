module Endpoints.OperationsForTransaction.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.OperationsForTransaction as OperationsForTransaction

import Msg exposing (Msg)

import Endpoints.OperationsForTransaction.Msg as OperationsForTransaction
import Endpoints.OperationsForTransaction.MsgFactory as OperationsForTransaction
import Endpoints.OperationsForTransaction.Model as OperationsForTransaction
import Endpoints.OperationsForTransaction.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : OperationsForTransaction.Msg -> OperationsForTransaction.Model -> (OperationsForTransaction.Model, Cmd Msg)
update msg model =

    case msg of
        OperationsForTransaction.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        OperationsForTransaction.Request endpoint settings ->
            let
                msg =
                    OperationsForTransaction.Response >> OperationsForTransaction.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ OperationsForTransaction.send msg request ]

        OperationsForTransaction.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error OperationsForTransaction.Error } ! []

        OperationsForTransaction.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : OperationsForTransaction.SettingsMsg -> OperationsForTransaction.Model -> OperationsForTransaction.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                OperationsForTransaction.UpdateTransaction inputMsg ->
                    { settingsModel | transaction = Input.update inputMsg settingsModel.transaction }

                OperationsForTransaction.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                OperationsForTransaction.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                OperationsForTransaction.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }