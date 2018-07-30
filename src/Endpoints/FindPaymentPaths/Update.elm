module Endpoints.FindPaymentPaths.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput
import Form.Select as Select

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.FindPaymentPaths as FindPaymentPaths

import Msg exposing (Msg)

import Endpoints.FindPaymentPaths.Msg as FindPaymentPaths
import Endpoints.FindPaymentPaths.MsgFactory as FindPaymentPaths
import Endpoints.FindPaymentPaths.Model as FindPaymentPaths
import Endpoints.FindPaymentPaths.RequestBuilder exposing (requestBuilder)


update : FindPaymentPaths.Msg -> FindPaymentPaths.Model -> (FindPaymentPaths.Model, Cmd Msg)
update msg model =

    case msg of
        FindPaymentPaths.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        FindPaymentPaths.Request endpoint settings ->
            let
                msg =
                    FindPaymentPaths.Response >> FindPaymentPaths.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ FindPaymentPaths.send msg request ]

        FindPaymentPaths.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error FindPaymentPaths.Error } ! []

        FindPaymentPaths.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : FindPaymentPaths.SettingsMsg -> FindPaymentPaths.Model -> FindPaymentPaths.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                FindPaymentPaths.UpdateSourceAccount inputMsg ->
                    { settingsModel | sourceAccount = Input.update inputMsg settingsModel.sourceAccount }

                FindPaymentPaths.UpdateDestinationAccount inputMsg ->
                    { settingsModel | destinationAccount = Input.update inputMsg settingsModel.destinationAccount }

                FindPaymentPaths.UpdateDestinationAssetType selectMsg ->
                    let
                        (destinationAssetType, cmds) =
                            Select.update selectMsg settingsModel.destinationAssetType

                    in
                        { settingsModel | destinationAssetType = destinationAssetType } ! [ Cmd.map (FindPaymentPaths.UpdateDestinationAssetType >> FindPaymentPaths.SettingsMsg >> FindPaymentPaths.composeMsg) cmds ]

                FindPaymentPaths.UpdateDestinationAssetCode inputMsg ->
                    { settingsModel | destinationAssetCode = Input.update inputMsg settingsModel.destinationAssetCode } ! []

                FindPaymentPaths.UpdateDestinationAssetIssuer inputMsg ->
                    { settingsModel | destinationAssetIssuer = Input.update inputMsg settingsModel.destinationAssetIssuer } ! []

                FindPaymentPaths.UpdateDestinationAmount intInputMsg ->
                    { settingsModel | destinationAmount = IntInput.update intInputMsg settingsModel.destinationAmount }

    in
        { model | settings = newSettingsModel }