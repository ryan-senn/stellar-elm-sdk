module Endpoints.OrderbookDetails.Model exposing (Model, initialModel, Settings)

import Http

import Stellar.Sorting as Sorting exposing (Sorting)
import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Endpoints.OrderbookDetails as OrderbookDetails

import Form.Input as Input
import Form.IntInput as IntInput
import Form.Select as Select


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error OrderbookDetails.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { sellingAssetType : Select.Model AssetType
    , sellingAssetCode : Input.Model
    , sellingAssetIssuer : Input.Model
    , buyingAssetType : Select.Model AssetType
    , buyingAssetCode : Input.Model
    , buyingAssetIssuer : Input.Model
    , limit : IntInput.Model
    }


initialSettings : Settings
initialSettings =
    { sellingAssetType = Select.init AssetType.asList
    , sellingAssetCode = Input.init
    , sellingAssetIssuer = Input.init
    , buyingAssetType = Select.init AssetType.asList
    , buyingAssetCode = Input.init
    , buyingAssetIssuer = Input.init
    , limit = IntInput.init
    }