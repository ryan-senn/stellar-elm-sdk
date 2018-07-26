module Endpoints.PostTransaction.Model exposing (Model, initialModel, Settings)

import Http

import Stellar.Sorting as Sorting exposing (Sorting)
import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Endpoints.PostTransaction as PostTransaction

import Form.TextArea as TextArea


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error PostTransaction.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { transactionEnvelopeXdr : TextArea.Model
    }


initialSettings : Settings
initialSettings =
    { transactionEnvelopeXdr = TextArea.init
    }