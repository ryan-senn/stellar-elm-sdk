module Model exposing (Model, initialModel)

import Http

import Stellar.Http.Accounts exposing (RequestSingleAccountResponse)


type alias Model =
    { accountResponse : Maybe (Result Http.Error RequestSingleAccountResponse)
    }


initialModel : Model
initialModel =
    { accountResponse = Nothing
    }