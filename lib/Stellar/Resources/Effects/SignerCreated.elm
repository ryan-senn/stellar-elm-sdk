module Stellar.Resources.Effects.SignerCreated exposing (SignerCreated, decoder)

{-| Signer created Effect

# Type alias and decoder
@docs SignerCreated, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Date exposing (Date)

import Stellar.PublicKey as PublicKey exposing (PublicKey)

import Stellar.Resources.Effects.Links as Links exposing (Links)


{-| Type alias
-}
type alias SignerCreated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , weight : Int
    , publicKey : PublicKey
    , key : String
    , createdAt : Date
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder SignerCreated
decoder =
    Decode.decode SignerCreated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "weight" Decode.int
        |> Decode.required "public_key" PublicKey.decoder
        |> Decode.required "key" Decode.string
        |> Decode.required "created_at" Decode.date
        |> Decode.required "_links" Links.decoder