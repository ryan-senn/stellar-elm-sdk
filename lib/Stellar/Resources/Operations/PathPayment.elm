module Stellar.Resources.Operations.PathPayment exposing (PathPayment, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Link as Link exposing (Link)


type alias PathPayment =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : String
    , from : String
    , to : String
    , assetCode : String
    , assetIssuer : String
    , assetType : AssetType
    , amount : String
    , sourceAssetCode : String
    , sourceAssetIssuer : String
    , sourceAssetType : AssetType
    , sourceMax : String
    , sourceAmount : String
    , links : Links
    }


decoder : Decoder PathPayment
decoder =
    Decode.decode PathPayment
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "from" Decode.string
        |> Decode.required "to" Decode.string
        |> Decode.required "asset_code" Decode.string
        |> Decode.required "asset_issuer" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
        |> Decode.required "amount" Decode.string
        |> Decode.required "source_asset_code" Decode.string
        |> Decode.required "source_asset_issuer" Decode.string
        |> Decode.required "source_asset_type" AssetType.decoder
        |> Decode.required "source_max" Decode.string
        |> Decode.required "source_amount" Decode.string
        |> Decode.required "_links" linksDecoder


type alias Links =
    { self : Link
    , succeeds : Link
    , precedes : Link
    , effects : Link
    , transaction : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder
        |> Decode.required "effects" Link.decoder
        |> Decode.required "transaction" Link.decoder