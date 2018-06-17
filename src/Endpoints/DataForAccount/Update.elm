module Endpoints.DataForAccount.Update exposing (update)

import Form.Input as Input
import Form.Select as Select

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.DataForAccount as DataForAccount

import Msg exposing (Msg)

import Endpoints.DataForAccount.Msg as DataForAccount
import Endpoints.DataForAccount.MsgFactory as DataForAccount
import Endpoints.DataForAccount.Model as DataForAccount
import Endpoints.DataForAccount.RequestBuilder exposing (requestBuilder)


update : DataForAccount.Msg -> DataForAccount.Model -> (DataForAccount.Model, Cmd Msg)
update msg model =

    case msg of
        DataForAccount.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model

        DataForAccount.Request endpoint settings ->
            let
                msg =
                    DataForAccount.Response >> DataForAccount.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ DataForAccount.send msg request ]

        DataForAccount.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error DataForAccount.Error } ! []

        DataForAccount.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : DataForAccount.SettingsMsg -> DataForAccount.Model -> (DataForAccount.Model, Cmd Msg)
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        (newSettingsModel, cmds) =
            case updateSettingsMsg of
                DataForAccount.UpdatePublicKey inputMsg ->
                    { settingsModel | publicKey = Input.update inputMsg settingsModel.publicKey } ! []

                DataForAccount.UpdateDataKey selectMsg ->
                    let
                        (dataKeyModel, cmds) =
                            Select.update selectMsg settingsModel.dataKey

                    in
                        { settingsModel | dataKey = dataKeyModel }
                            ! [ Cmd.map (DataForAccount.UpdateDataKey >> DataForAccount.SettingsMsg >> DataForAccount.composeMsg) cmds ]

    in
        { model | settings = newSettingsModel } ! [ cmds ]