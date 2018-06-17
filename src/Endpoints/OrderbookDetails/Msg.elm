module Endpoints.OrderbookDetails.Msg exposing (Msg (..), SettingsMsg (..))

import Http

import Stellar.AssetType exposing (AssetType)

import Stellar.Endpoints.OrderbookDetails as OrderbookDetails

import Form.Input as Input
import Form.IntInput as IntInput
import Form.Select as Select

import Endpoints.OrderbookDetails.Model exposing (Settings)


type Msg
    = SettingsMsg SettingsMsg
    | Request Input.Model Settings
    | Response (Result Http.Error OrderbookDetails.Response)


type SettingsMsg
    = UpdateSellingAssetType (Select.Msg AssetType)
    | UpdateSellingAssetCode Input.Msg
    | UpdateSellingAssetIssuer Input.Msg
    | UpdateBuyingAssetType (Select.Msg AssetType)
    | UpdateBuyingAssetCode Input.Msg
    | UpdateBuyingAssetIssuer Input.Msg
    | UpdateLimit IntInput.Msg