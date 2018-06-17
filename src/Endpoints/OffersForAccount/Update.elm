module Endpoints.OffersForAccount.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Errors.Error exposing (flattenError)

import Stellar.Endpoints.OffersForAccount as OffersForAccount

import Msg exposing (Msg)

import Endpoints.OffersForAccount.Msg as OffersForAccount
import Endpoints.OffersForAccount.MsgFactory as OffersForAccount
import Endpoints.OffersForAccount.Model as OffersForAccount
import Endpoints.OffersForAccount.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : OffersForAccount.Msg -> OffersForAccount.Model -> (OffersForAccount.Model, Cmd Msg)
update msg model =

    case msg of
        OffersForAccount.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        OffersForAccount.Request endpoint settings ->
            let
                msg =
                    OffersForAccount.Response >> OffersForAccount.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ OffersForAccount.send msg request ]

        OffersForAccount.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error OffersForAccount.Error } ! []

        OffersForAccount.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : OffersForAccount.SettingsMsg -> OffersForAccount.Model -> OffersForAccount.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                OffersForAccount.UpdateAccount inputMsg ->
                    { settingsModel | account = Input.update inputMsg settingsModel.account }

                OffersForAccount.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                OffersForAccount.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                OffersForAccount.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }