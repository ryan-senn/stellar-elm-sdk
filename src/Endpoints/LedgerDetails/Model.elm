module Endpoints.LedgerDetails.Model exposing (Model, initialModel)

import Http

import Stellar.Endpoints.LedgerDetails as LedgerDetails

import Form.IntInput as IntInput


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error LedgerDetails.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { sequence : IntInput.Model
    }


initialSettings : Settings
initialSettings =
    { sequence = IntInput.init
    }