module Model exposing (Model, initialModel)

import Http

import Routes exposing (Route (Home))

import Endpoints.Model as Endpoints

import Stellar.Endpoints.AllAssets as AllAssets
import Stellar.Endpoints.DataForAccount as DataForAccount


type alias Model =
    { route : Maybe Route
    , endpoints : Endpoints.Model
    , allAssetsResponse : Maybe (Result Http.Error AllAssets.Response)
    , dataForAccountResponse : Maybe (Result Http.Error DataForAccount.Response)
    }


initialModel : Model
initialModel =
    { route = Just Home
    , endpoints = Endpoints.initialModel
    , allAssetsResponse = Nothing
    , dataForAccountResponse = Nothing
    }