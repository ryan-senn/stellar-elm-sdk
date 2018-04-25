module Stellar.Account exposing (Account, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Thresholds as Thresholds exposing (Thresholds)
import Stellar.Flags as Flags exposing (Flags)
import Stellar.Balance as Balance exposing (Balance)
import Stellar.Signer as Signer exposing (Signer)
import Stellar.Links as Links exposing (Links)


type alias Account =
    { links : Links
    , id : PublicKey
    , pagingToken : String
    , accountId : PublicKey
    , sequence : String
    , subentryCount : Int
    , thresholds : Thresholds
    , flags : Flags
    , balances : List Balance
    , signers : List Signer
    }


decoder : Decoder Account
decoder =
    Decode.decode Account
        |> Decode.required "_links" Links.decoder
        |> Decode.required "id" PublicKey.decoder
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "account_id" PublicKey.decoder
        |> Decode.required "sequence" Decode.string
        |> Decode.required "subentry_count" Decode.int
        |> Decode.required "thresholds" Thresholds.decoder
        |> Decode.required "flags" Flags.decoder
        |> Decode.required "balances" (Decode.list Balance.decoder)
        |> Decode.required "signers" (Decode.list Signer.decoder)