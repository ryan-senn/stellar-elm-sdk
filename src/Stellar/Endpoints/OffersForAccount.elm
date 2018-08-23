module Stellar.Endpoints.OffersForAccount exposing
    ( requestBuilder
    , setCursor, setLimit, setSorting
    , send, Response (..)
    )

{-| Offers for Account Endpoint

# Build the Request with required fields
@docs requestBuilder

# Configure pagination
@docs setCursor, setLimit, setSorting

# Send the Request & catch Response
@docs send, Response

-}

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Sorting as Sorting exposing (Sorting)
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.PublicKey as PublicKey exposing (PublicKey)

import Stellar.Resources.Page exposing (Page)
import Stellar.Resources.Internal.Page as Page

import Stellar.Resources.Offer exposing (Offer)
import Stellar.Resources.Internal.Offer as Offer

import Stellar.Error exposing (Error)
import Stellar.Internal.Error as Error


{-| Request Builder. Takes the mandatory fields as arguments, the optional fields can be piped using setters.
-}
requestBuilder : Endpoint -> PublicKey -> RequestBuilder Response
requestBuilder endpoint publicKey =

    HttpBuilder.get (url endpoint publicKey)
        |> withExpect (Http.expectJson decoder)


{-| Send the request once configured.
-}
send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


{-| Set the pagination cursor for the Request.
-}
setCursor : String -> RequestBuilder Response -> RequestBuilder Response
setCursor cursor requestBuilder =
    requestBuilder
        |> withQueryParams [("cursor", cursor)]


{-| Set the pagination limit for the Request.
-}
setLimit : Int -> RequestBuilder Response -> RequestBuilder Response
setLimit limit requestBuilder =
    requestBuilder
        |> withQueryParams [("limit", toString limit)]


{-| Set the pagination sorting for the Request.
-}
setSorting : Sorting -> RequestBuilder Response -> RequestBuilder Response
setSorting sorting requestBuilder =
    requestBuilder
        |> withQueryParams [("order", Sorting.toString sorting)]


url : Endpoint -> PublicKey -> String
url endpoint publicKey =

    endpoint
    ++ "/accounts/"
    ++ publicKey
    ++ "/offers"


{-| The Response coming back from the server.
-}
type Response
    = Error Error
    | Success (Page Offer)


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success (Page.decoder Offer.decoder)
        ]