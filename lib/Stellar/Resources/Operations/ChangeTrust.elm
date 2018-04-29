module Stellar.Resources.Operations.ChangeTrust exposing (ChangeTrust, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Href as Href exposing (Href)
import Stellar.PublicKey as PublicKey exposing (PublicKey)


type alias ChangeTrust =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : String
    , assetCode : String
    , assetIssuer : String
    , assetType : AssetType
    , trustee : String
    , trustor : String
    , limit : String
    , links : Links
    }


decoder : Decoder ChangeTrust
decoder =
    Decode.decode ChangeTrust
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "asset_code" Decode.string
        |> Decode.required "asset_issuer" Decode.string
        |> Decode.required "asset_type" AssetType.decoder
        |> Decode.required "trustee" Decode.string
        |> Decode.required "trustor" Decode.string
        |> Decode.required "limit" Decode.string
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