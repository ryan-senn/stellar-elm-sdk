module Msg exposing (Msg (..))

import Http

import Routes exposing (Route)

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)

import Stellar.Endpoints.AccountDetails as AccountDetails
import Stellar.Endpoints.AllAssets as AllAssets


type Msg
    = SetRoute (Maybe Route)
    | AccountRequest Endpoint PublicKey
    | AccountResponse (Result Http.Error AccountDetails.Response)
    | AllAssetsRequest Endpoint
    | AllAssetsResponse (Result Http.Error AllAssets.Response)