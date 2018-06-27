module Stellar.Resources.Effects.SignerUpdated exposing (SignerUpdated, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)
import Stellar.PublicKey as PublicKey exposing (PublicKey)


type alias SignerUpdated =
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


decoder : Decoder SignerUpdated
decoder =
    Decode.decode SignerUpdated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "weight" Decode.int
        |> Decode.required "public_key" PublicKey.decoder
        |> Decode.required "key" Decode.string
        |> Decode.required "_links" linksDecoder


type alias Links =
    { operation : Link
    , succeeds : Link
    , precedes : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "operation" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder