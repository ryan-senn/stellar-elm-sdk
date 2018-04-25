module Msg exposing (Msg (..))

import Http

import Routes exposing (Route)

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)

import Stellar.Http.Accounts as StellarAccounts


type Msg
    = SetRoute (Maybe Route)
    | AccountRequest Endpoint PublicKey
    | AccountResponse (Result Http.Error StellarAccounts.Response)
--    | AllAssetsRequest Endpoint PublicKey
--    | AllAssetsResponse (Result Http.Error StellarAccounts.Response)