module Stellar.Endpoints.EffectsForTransaction exposing
    ( requestBuilder
    , setCursor, setLimit, setSorting
    , send, Response(..)
    )

{-| Effects for Transaction Endpoint


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
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Error exposing (Error)
import Stellar.Internal.Error as Error
import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Resources.Effect exposing (Effect)
import Stellar.Resources.Internal.Effect as Effect
import Stellar.Resources.Internal.Page as Page
import Stellar.Resources.Page exposing (Page)
import Stellar.Sorting as Sorting exposing (Sorting)


{-| Request Builder. Takes the mandatory fields as arguments, the optional fields can be piped using setters.
-}
requestBuilder : Endpoint -> String -> RequestBuilder Response
requestBuilder endpoint hash =
    HttpBuilder.get (url endpoint hash)
        |> withExpect (Http.expectJson decoder)


{-| Send the request once configured.
-}
send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


{-| Set the pagination cursor for the Request.
-}
setCursor : String -> RequestBuilder Response -> RequestBuilder Response
setCursor cursor requestBuilder_ =
    requestBuilder_
        |> withQueryParams [ ( "cursor", cursor ) ]


{-| Set the pagination limit for the Request.
-}
setLimit : Int -> RequestBuilder Response -> RequestBuilder Response
setLimit limit requestBuilder_ =
    requestBuilder_
        |> withQueryParams [ ( "limit", String.fromInt limit ) ]


{-| Set the pagination sorting for the Request.
-}
setSorting : Sorting -> RequestBuilder Response -> RequestBuilder Response
setSorting sorting requestBuilder_ =
    requestBuilder_
        |> withQueryParams [ ( "order", Sorting.toString sorting ) ]


url : Endpoint -> String -> String
url endpoint hash =
    endpoint
        ++ "/transactions/"
        ++ hash
        ++ "/effects"


{-| The Response coming back from the server.
-}
type Response
    = Error Error
    | Success (Page Effect)


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success (Page.decoder Effect.decoder)
        ]
