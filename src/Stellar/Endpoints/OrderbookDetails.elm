module Stellar.Endpoints.OrderbookDetails exposing
    ( requestBuilder
    , setSellingAssetCode, setSellingAssetIssuer, setBuyingAssetCode, setBuyingAssetIssuer
    , setLimit
    , send, Response(..)
    )

{-| Orderbook Details Endpoint


# Build the Request with required fields

@docs requestBuilder


# Configure optional fields

@docs setSellingAssetCode, setSellingAssetIssuer, setBuyingAssetCode, setBuyingAssetIssuer


# Configure pagination

@docs setLimit


# Send the Request & catch Response

@docs send, Response

-}

import Http
import HttpBuilder exposing (..)
import Json.Decode as Decode exposing (Decoder)
import Stellar.AssetType as AssetType exposing (AssetType)
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Error exposing (Error)
import Stellar.Internal.Error as Error
import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Resources.Internal.Orderbook as Orderbook
import Stellar.Resources.Orderbook exposing (Orderbook)


{-| Request Builder. Takes the mandatory fields as arguments, the optional fields can be piped using setters.
-}
requestBuilder : Endpoint -> AssetType -> AssetType -> RequestBuilder Response
requestBuilder endpoint sellingAssetType buyingAssetType =
    HttpBuilder.get (url endpoint)
        |> withExpect (Http.expectJson decoder)
        |> withQueryParams [ ( "selling_asset_type", AssetType.toString sellingAssetType ) ]
        |> withQueryParams [ ( "buying_asset_type", AssetType.toString buyingAssetType ) ]


{-| Send the request once configured.
-}
send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


{-| Set the selling Asset Code.
-}
setSellingAssetCode : String -> RequestBuilder Response -> RequestBuilder Response
setSellingAssetCode sellingAssetCode requestBuilder =
    requestBuilder
        |> withQueryParams [ ( "selling_asset_code", sellingAssetCode ) ]


{-| Set the selling Asset Issuer.
-}
setSellingAssetIssuer : PublicKey -> RequestBuilder Response -> RequestBuilder Response
setSellingAssetIssuer sellingAssetIssuer requestBuilder =
    requestBuilder
        |> withQueryParams [ ( "selling_asset_issuer", sellingAssetIssuer ) ]


{-| Set the buying Asset Code.
-}
setBuyingAssetCode : String -> RequestBuilder Response -> RequestBuilder Response
setBuyingAssetCode buyingAssetCode requestBuilder =
    requestBuilder
        |> withQueryParams [ ( "buying_asset_code", buyingAssetCode ) ]


{-| Set the buying Asset Issuer.
-}
setBuyingAssetIssuer : PublicKey -> RequestBuilder Response -> RequestBuilder Response
setBuyingAssetIssuer buyingAssetIssuer requestBuilder =
    requestBuilder
        |> withQueryParams [ ( "buying_asset_issuer", buyingAssetIssuer ) ]


{-| Set the pagination limit for the Request.
-}
setLimit : Int -> RequestBuilder Response -> RequestBuilder Response
setLimit limit requestBuilder =
    requestBuilder
        |> withQueryParams [ ( "limit", toString limit ) ]


url : Endpoint -> String
url endpoint =
    endpoint ++ "/order_book"


{-| The Response coming back from the server.
-}
type Response
    = Error Error
    | Success Orderbook


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Orderbook.decoder
        ]
