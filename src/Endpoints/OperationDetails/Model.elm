module Endpoints.OperationDetails.Model exposing (Model, initialModel, Settings)

import Http

import Form.IntInput as IntInput

import Stellar.Endpoints.OperationDetails as OperationDetails


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error OperationDetails.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { operationId : IntInput.Model
    }


initialSettings : Settings
initialSettings =
    { operationId = IntInput.init
    }