module Endpoints.AccountDetails.Update exposing (update)

import Form.Input as Input

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.AccountDetails as AccountDetails

import Msg exposing (Msg)

import Endpoints.AccountDetails.Msg as AccountDetails
import Endpoints.AccountDetails.MsgFactory as AccountDetails
import Endpoints.AccountDetails.Model as AccountDetails
import Endpoints.AccountDetails.RequestBuilder exposing (requestBuilder)


update : AccountDetails.Msg -> AccountDetails.Model -> (AccountDetails.Model, Cmd Msg)
update msg model =

    case msg of
        AccountDetails.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        AccountDetails.Request endpoint settings ->
            let
                msg =
                    AccountDetails.Response >> AccountDetails.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ AccountDetails.send msg request ]

        AccountDetails.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error AccountDetails.Error } ! []

        AccountDetails.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : AccountDetails.SettingsMsg -> AccountDetails.Model -> AccountDetails.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                AccountDetails.UpdatePublicKey inputMsg ->
                    { settingsModel | publicKey = Input.update inputMsg settingsModel.publicKey }

    in
        { model | settings = newSettingsModel }