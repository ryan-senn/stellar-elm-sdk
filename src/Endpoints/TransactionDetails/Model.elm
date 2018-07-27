module Endpoints.TransactionDetails.Model exposing (Model, initialModel)

import Http

import Stellar.Endpoints.TransactionDetails as TransactionDetails

import Form.Input as Input


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error TransactionDetails.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { hash : Input.Model
    }


initialSettings : Settings
initialSettings =
    { hash = Input.init
    }