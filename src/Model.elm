module Model exposing (Model, initialModel)

import Http

import Routes exposing (Route (Home))

import Stellar.Http.Accounts as StellarAccounts
import Stellar.Http.Assets as StellarAssets


type alias Model =
    { route : Maybe Route
    , accountResponse : Maybe (Result Http.Error StellarAccounts.Response)
    , allAssetsResponse : Maybe (Result Http.Error StellarAssets.Response)
    }


initialModel : Model
initialModel =
    { route = Just Home
    , accountResponse = Nothing
    , allAssetsResponse = Nothing
    }