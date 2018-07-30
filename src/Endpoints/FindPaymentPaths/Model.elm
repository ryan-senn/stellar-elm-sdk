module Endpoints.FindPaymentPaths.Model exposing (Model, initialModel, Settings)

import Http

import Form.Input as Input
import Form.IntInput as IntInput
import Form.Select as Select

import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Endpoints.FindPaymentPaths as FindPaymentPaths


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error FindPaymentPaths.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { sourceAccount : Input.Model
    , destinationAccount : Input.Model
    , destinationAssetType : Select.Model AssetType
    , destinationAssetCode : Input.Model
    , destinationAssetIssuer : Input.Model
    , destinationAmount : IntInput.Model
    }


initialSettings : Settings
initialSettings =
    { sourceAccount = Input.init
    , destinationAccount = Input.init
    , destinationAssetType = Select.init AssetType.asList
    , destinationAssetCode = Input.init
    , destinationAssetIssuer = Input.init
    , destinationAmount = IntInput.init
    }