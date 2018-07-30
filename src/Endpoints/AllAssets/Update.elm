module Endpoints.AllAssets.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput

import Stellar.Error exposing (flattenError)

import Stellar.Endpoints.AllAssets as AllAssets

import Msg exposing (Msg)

import Endpoints.AllAssets.Msg as AllAssets
import Endpoints.AllAssets.MsgFactory as AllAssets
import Endpoints.AllAssets.Model as AllAssets
import Endpoints.AllAssets.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : AllAssets.Msg -> AllAssets.Model -> (AllAssets.Model, Cmd Msg)
update msg model =

    case msg of
        AllAssets.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model ! []

        AllAssets.Request endpoint settings ->
            let
                msg =
                    AllAssets.Response >> AllAssets.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ AllAssets.send msg request ]

        AllAssets.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error AllAssets.Error } ! []

        AllAssets.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : AllAssets.SettingsMsg -> AllAssets.Model -> AllAssets.Model
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        newSettingsModel =
            case updateSettingsMsg of
                AllAssets.UpdateAssetCode inputMsg ->
                    { settingsModel | assetCode = Input.update inputMsg settingsModel.assetCode }

                AllAssets.UpdateAssetIssuer inputMsg ->
                    { settingsModel | assetIssuer = Input.update inputMsg settingsModel.assetIssuer }

                AllAssets.UpdateCursor inputMsg ->
                    { settingsModel | cursor = Input.update inputMsg settingsModel.cursor }

                AllAssets.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit }

                AllAssets.UpdateSorting sorting ->
                    { settingsModel | sorting = if settingsModel.sorting == Just sorting then Nothing else Just sorting }

    in
        { model | settings = newSettingsModel }