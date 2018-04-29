module Stellar.Resources.Operations.SetOptions exposing (SetOptions, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Href as Href exposing (Href)
import Stellar.PublicKey as PublicKey exposing (PublicKey)


type alias SetOptions =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : String
    , signerKey : PublicKey
    , signerWeight : Int
    , masterKeyWeight : Int
    , lowThreshold : Int
    , medThreshold : Int
    , highThreshold : Int
    , homeDomain : String
    , setFlags : List Int
    , setFlagsS : List String
    , clearFlags : List Int
    , clearFlagsS : List String
    , links : Links
    }


decoder : Decoder SetOptions
decoder =
    Decode.decode SetOptions
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "signer_key" Decode.int
        |> Decode.required "signer_weight" Decode.int
        |> Decode.required "master_key_weight" Decode.int
        |> Decode.required "low_threshold" Decode.int
        |> Decode.required "med_threshold" Decode.int
        |> Decode.required "high_threshold" Decode.int
        |> Decode.required "home_domain" Decode.string
        |> Decode.required "set_flags" Decode.list Int
        |> Decode.required "set_flags_s" Decode.list String
        |> Decode.required "clear_flags" Decode.list Int
        |> Decode.required "clear_flags_s" Decode.list String
        |> Decode.required "_links" linksDecoder


type alias Links =
    { self : Href
    , succeeds : Href
    , precedes : Href
    , effects : Href
    , transaction : Href
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Href.decoder
        |> Decode.required "succeeds" Href.decoder
        |> Decode.required "precedes" Href.decoder
        |> Decode.required "effects" Href.decoder
        |> Decode.required "transaction" Href.decoder