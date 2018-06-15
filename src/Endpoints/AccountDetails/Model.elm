module Endpoints.AccountDetails.Model exposing (Model, initialModel)

import Http

import Stellar.Endpoints.AccountDetails as AccountDetails

import Form.Input as Input


type alias Model =
    { publicKey : Input.Model
    , isLoading : Bool
    , response : Maybe (Result Http.Error AccountDetails.Response)
    }


initialModel : Model
initialModel =
    { publicKey = Input.init
    , isLoading = False
    , response = Nothing
    }