module Stellar.Resources.Operations.Internal.SetOptions exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Operations.SetOptions exposing (SetOptions)

import Stellar.Internal.PublicKey as PublicKey

import Stellar.Resources.Operations.Internal.Links as Links


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