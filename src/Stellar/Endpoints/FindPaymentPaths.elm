module Stellar.Endpoints.FindPaymentPaths exposing
    ( requestBuilder
    , setDestinationAssetCode, setDestinationAssetIssuer
    , send, Response (..)
    )

{-| Find Payment Paths Endpoint

# Build the Request with required fields
@docs requestBuilder

# Configure optional fields
@docs setDestinationAssetCode, setDestinationAssetIssuer

# Send the Request & catch Response
@docs send, Response

-}

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Endpoint exposing (Endpoint)
import Stellar.PublicKey exposing (PublicKey)
import Stellar.AssetType as AssetType exposing (AssetType)

import Stellar.Resources.Operation exposing (Operation)
import Stellar.Resources.Internal.Operation as Operation

import Stellar.Error exposing (Error)
import Stellar.Internal.Error as Error


{-| Request Builder. Takes the mandatory fields as arguments, the optional fields can be piped using setters.
-}
requestBuilder : Endpoint -> PublicKey -> PublicKey -> AssetType -> Int -> RequestBuilder Response
requestBuilder endpoint sourceAccount destinationAccount assetType amount =

    HttpBuilder.get (url endpoint)
        |> withExpect (Http.expectJson decoder)
        |> withQueryParams [("source_account", sourceAccount)]
        |> withQueryParams [("destination_account", destinationAccount)]
        |> withQueryParams [("destination_asset_type", AssetType.toString assetType)]
        |> withQueryParams [("destination_amount", toString amount)]


{-| Send the request once configured.
-}
send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


{-| Set the Destination Asset Code.
-}
setDestinationAssetCode : String -> RequestBuilder Response -> RequestBuilder Response
setDestinationAssetCode destinationAssetCode requestBuilder =
    requestBuilder
        |> withQueryParams [("destination_asset_code", destinationAssetCode)]


{-| Set the Destination Asset Issuer.
-}
setDestinationAssetIssuer : PublicKey -> RequestBuilder Response -> RequestBuilder Response
setDestinationAssetIssuer destinationAssetIssuer requestBuilder =
    requestBuilder
        |> withQueryParams [("destination_asset_issuer", destinationAssetIssuer)]


url : Endpoint -> String
url endpoint =

    endpoint ++ "/paths"


{-| The Response coming back from the server.
-}
type Response
    = Error Error
    | Success Operation


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Operation.decoder
        ]