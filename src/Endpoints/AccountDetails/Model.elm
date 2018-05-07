module Endpoints.AccountDetails.Model exposing (Model, initialModel)

import Http

import Stellar.Endpoints.AccountDetails as AccountDetails

import Form.TextInput as TextInput


type alias Model =
    { publicKey : TextInput.Model
    , isLoading : Bool
    , response : Maybe (Result Http.Error AccountDetails.Response)
    }


initialModel : Model
initialModel =
    { publicKey = TextInput.init
    , isLoading = False
    , response = Nothing
    }