module Msg exposing (Msg (..))

import Http

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)

import Stellar.Http.Accounts exposing (RequestSingleAccountResponse)


type Msg
    = AccountRequest Endpoint PublicKey
    | AccountResponse (Result Http.Error RequestSingleAccountResponse)