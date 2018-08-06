module Stellar.Resources.Account exposing (Account, decoder)

{-| Record to represent a Balance

# Type alias and Decoder
@docs Account, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Thresholds as Thresholds exposing (Thresholds)
import Stellar.Flags as Flags exposing (Flags)
import Stellar.Balance as Balance exposing (Balance)
import Stellar.Signer as Signer exposing (Signer)
import Stellar.Link as Link exposing (Link)

import Stellar.Resources.Data as Data exposing (Data)


{-| Type alias
-}
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


{-| Decoder
-}
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


{-| Links
-}
type alias Links =
    { toml : Maybe Link
    , data : Maybe Link
    , effects : Maybe Link
    , offers : Maybe Link
    , operations : Maybe Link
    , payments : Maybe Link
    , self : Maybe Link
    , trades : Maybe Link
    , transactions : Maybe Link
    }


{-| Links decoder
-}
linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.optional "toml" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "data" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "effects" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "offers" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "operations" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "payments" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "self" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "trades" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "transactions" (Decode.maybe Link.decoder) Nothing