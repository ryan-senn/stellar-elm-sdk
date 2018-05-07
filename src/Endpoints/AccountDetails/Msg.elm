module Endpoints.AccountDetails.Msg exposing (Msg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)

import Stellar.Endpoints.AccountDetails as AccountDetails


type Msg
    = Request Endpoint PublicKey
    | Response (Result Http.Error AccountDetails.Response)