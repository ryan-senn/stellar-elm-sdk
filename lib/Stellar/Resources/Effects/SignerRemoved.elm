module Stellar.Resources.Effects.SignerRemoved exposing (SignerRemoved, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)
import Stellar.PublicKey as PublicKey exposing (PublicKey)


type alias SignerRemoved =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , weight : Int
    , publicKey : PublicKey
    , key : String
    , links : Links
    }


decoder : Decoder SignerRemoved
decoder =
    Decode.decode SignerRemoved
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "weight" Decode.int
        |> Decode.required "public_key" PublicKey.decoder
        |> Decode.required "key" Decode.string
        |> Decode.required "_links" Links.decoder