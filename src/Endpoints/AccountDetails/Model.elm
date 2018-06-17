module Endpoints.AccountDetails.Model exposing (Model, initialModel, Settings)

import Http

import Stellar.Endpoints.AccountDetails as AccountDetails

import Form.Input as Input


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error AccountDetails.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { publicKey : Input.Model
    }


initialSettings : Settings
initialSettings =
    { publicKey = Input.init
    }