module Stellar.Resources.Operations.SetOptions exposing (SetOptions, decoder)

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.PublicKey as PublicKey exposing (PublicKey)

import Stellar.Resources.Operations.Links as Links exposing (Links)


{-| Type alias
-}
type alias SetOptions =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , homeDomain : Maybe String
    , inflationDestination : Maybe String
    , masterKeyWeight : Maybe Int
    , signerKey : Maybe PublicKey
    , signerWeight : Maybe Int
    , setFlags : List Int
    , setFlagsS : List String
    , clearFlags : List Int
    , clearFlagsS : List String
    , lowThreshold : Maybe Int
    , medThreshold : Maybe Int
    , highThreshold : Maybe Int
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder SetOptions
decoder =
    Decode.decode SetOptions
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.date
        |> Decode.required "transaction_hash" Decode.string
        |> Decode.optional "home_domain" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "inflation_dest" (Decode.maybe Decode.string) Nothing
        |> Decode.optional "master_key_weight" (Decode.maybe Decode.int) Nothing
        |> Decode.optional "signer_key" (Decode.maybe PublicKey.decoder) Nothing
        |> Decode.optional "signer_weight" (Decode.maybe Decode.int) Nothing
        |> Decode.optional "set_flags" (Decode.list Decode.int) []
        |> Decode.optional "set_flags_s" (Decode.list Decode.string) []
        |> Decode.optional "clear_flags" (Decode.list Decode.int) []
        |> Decode.optional "clear_flags_s" (Decode.list Decode.string) []
        |> Decode.optional "low_threshold" (Decode.maybe Decode.int) Nothing
        |> Decode.optional "med_threshold" (Decode.maybe Decode.int) Nothing
        |> Decode.optional "high_threshold" (Decode.maybe Decode.int) Nothing
        |> Decode.required "_links" Links.decoder