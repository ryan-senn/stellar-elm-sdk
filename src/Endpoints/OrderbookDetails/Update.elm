module Endpoints.OrderbookDetails.Update exposing (update)

import Form.Input as Input
import Form.IntInput as IntInput
import Form.Select as Select

import Stellar.Error exposing (flattenError)

import Stellar.AssetType as AssetType

import Stellar.Endpoints.OrderbookDetails as OrderbookDetails

import Msg exposing (Msg)

import Endpoints.OrderbookDetails.Msg as OrderbookDetails
import Endpoints.OrderbookDetails.MsgFactory as OrderbookDetails
import Endpoints.OrderbookDetails.Model as OrderbookDetails
import Endpoints.OrderbookDetails.RequestBuilder exposing (requestBuilder)

import Endpoints.Helpers as Helpers


update : OrderbookDetails.Msg -> OrderbookDetails.Model -> (OrderbookDetails.Model, Cmd Msg)
update msg model =

    case msg of
        OrderbookDetails.SettingsMsg updateSettingsMsg ->
            updateSettings updateSettingsMsg model

        OrderbookDetails.Request endpoint settings ->
            let
                msg =
                    OrderbookDetails.Response >> OrderbookDetails.composeMsg

                request =
                    requestBuilder endpoint settings

            in
                { model | isLoading = True } ! [ OrderbookDetails.send msg request ]

        OrderbookDetails.Response (Err error) ->
            { model | isLoading = False, response = Just <| flattenError error OrderbookDetails.Error } ! []

        OrderbookDetails.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []


updateSettings : OrderbookDetails.SettingsMsg -> OrderbookDetails.Model -> (OrderbookDetails.Model, Cmd Msg)
updateSettings updateSettingsMsg model =

    let
        settingsModel =
            model.settings

        (newSettingsModel, cmds) =
            case updateSettingsMsg of
                OrderbookDetails.UpdateSellingAssetType selectMsg ->
                    let
                        (sellingAssetType, cmds) =
                            Select.update selectMsg settingsModel.sellingAssetType

                    in
                        { settingsModel | sellingAssetType = sellingAssetType } ! [ Cmd.map (OrderbookDetails.UpdateSellingAssetType >> OrderbookDetails.SettingsMsg >> OrderbookDetails.composeMsg) cmds ]

                OrderbookDetails.UpdateSellingAssetCode inputMsg ->
                    { settingsModel | sellingAssetCode = Input.update inputMsg settingsModel.sellingAssetCode } ! []

                OrderbookDetails.UpdateSellingAssetIssuer inputMsg ->
                    { settingsModel | sellingAssetIssuer = Input.update inputMsg settingsModel.sellingAssetIssuer } ! []

                OrderbookDetails.UpdateBuyingAssetType selectMsg ->
                    let
                        (buyingAssetType, cmds) =
                            Select.update selectMsg settingsModel.buyingAssetType

                    in
                        { settingsModel | buyingAssetType = buyingAssetType } ! [ Cmd.map (OrderbookDetails.UpdateBuyingAssetType >> OrderbookDetails.SettingsMsg >> OrderbookDetails.composeMsg) cmds ]

                OrderbookDetails.UpdateBuyingAssetCode inputMsg ->
                    { settingsModel | buyingAssetCode = Input.update inputMsg settingsModel.buyingAssetCode } ! []

                OrderbookDetails.UpdateBuyingAssetIssuer inputMsg ->
                    { settingsModel | buyingAssetIssuer = Input.update inputMsg settingsModel.buyingAssetIssuer } ! []

                OrderbookDetails.UpdateLimit intInputMsg ->
                    { settingsModel | limit = IntInput.update intInputMsg settingsModel.limit } ! []

    in
        { model | settings = newSettingsModel } ! [ cmds ]