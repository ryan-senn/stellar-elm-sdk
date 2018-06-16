module Endpoints.AllAssets.Model exposing (Model, initialModel, Settings)

import Http

import Stellar.Sorting as Sorting exposing (Sorting)

import Stellar.Endpoints.AllAssets as AllAssets

import Form.Input as Input
import Form.IntInput as IntInput


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error AllAssets.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { assetCode : Input.Model
    , assetIssuer : Input.Model
    , cursor : Input.Model
    , limit : IntInput.Model
    , sorting : Maybe Sorting
    }


initialSettings : Settings
initialSettings =
    { assetCode = Input.init
    , assetIssuer = Input.init
    , cursor = Input.init
    , limit = IntInput.init
    , sorting = Nothing
    }