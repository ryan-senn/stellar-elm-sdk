module Stellar.Resources.Account exposing (Account, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Thresholds as Thresholds exposing (Thresholds)
import Stellar.Flags as Flags exposing (Flags)
import Stellar.Balance as Balance exposing (Balance)
import Stellar.Signer as Signer exposing (Signer)
import Stellar.Href as Href exposing (Href)

import Stellar.Resources.Data as Data exposing (Data)


type alias Account =
    { id : PublicKey
    , accountId : PublicKey
    , sequence : String
    , subentryCount : Int
    , balances : List Balance
    , thresholds : Thresholds
    , signers : List Signer
    , data : Data
    , flags : Flags
    , pagingToken : String
    , links : Links
    }


decoder : Decoder Account
decoder =
    Decode.decode Account
        |> Decode.required "id" PublicKey.decoder
        |> Decode.required "account_id" PublicKey.decoder
        |> Decode.required "sequence" Decode.string
        |> Decode.required "subentry_count" Decode.int
        |> Decode.required "balances" (Decode.list Balance.decoder)
        |> Decode.required "thresholds" Thresholds.decoder
        |> Decode.required "signers" (Decode.list Signer.decoder)
        |> Decode.required "data" Data.decoder
        |> Decode.required "flags" Flags.decoder
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "_links" linksDecoder


type alias Links =
    { toml : Href
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "toml" Href.decoder