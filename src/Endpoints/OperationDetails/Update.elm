module Endpoints.OperationDetails.Update exposing (update)

import Form.IntInput as IntInput

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.OperationDetails as OperationDetails

import Msg exposing (Msg)

import Endpoints.OperationDetails.Msg as OperationDetails
import Endpoints.OperationDetails.MsgFactory as OperationDetails
import Endpoints.OperationDetails.Model as OperationDetails
import Endpoints.OperationDetails.RequestBuilder exposing (requestBuilder)


update : OperationDetails.Msg -> OperationDetails.Model -> (OperationDetails.Model, Cmd Msg)
update msg model =

    case msg of
        OperationDetails.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        OperationDetails.Request endpoint settings ->
            let
                msg =
                    OperationDetails.Response >> OperationDetails.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ OperationDetails.send msg request ]

        OperationDetails.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error OperationDetails.Error } ! []

        OperationDetails.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : OperationDetails.SettingsMsg -> OperationDetails.Model -> OperationDetails.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                OperationDetails.UpdatePublicKey intInputMsg ->
                    { settingsModel | operationId = IntInput.update intInputMsg settingsModel.operationId }

    in
        { model | settings = newSettingsModel }