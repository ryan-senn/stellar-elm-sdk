module Stellar.Resources.Operations.Payment exposing (Payment, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Link as Link exposing (Link)


type alias Payment =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , from : String
    , to : String
    , assetType : AssetType
    , assetCode : String
    , assetIssuer : String
    , links : Links
    }


decoder : Decoder Payment
decoder =
    Decode.decode Payment
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "from" Decode.string
        |> Decode.required "to" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
        |> Decode.required "asset_code" Decode.string
        |> Decode.required "asset_issuer" Decode.string
        |> Decode.required "_links" linksDecoder


type alias Links =
    { self : Link
    , succeeds : Link
    , precedes : Link
    , effects : Link
    , transaction : Link
    , sender : Link
    , receiver : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder
        |> Decode.required "effects" Link.decoder
        |> Decode.required "transaction" Link.decoder
        |> Decode.required "sender" Link.decoder
        |> Decode.required "receiver" Link.decoder