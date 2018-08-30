module Stellar.Endpoints.PaymentsForLedger exposing
    ( requestBuilder
    , setCursor, setLimit, setSorting
    , send, Response(..)
    )

{-| Payments for Ledger Endpoint


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
import Stellar.Resources.Internal.Page as Page
import Stellar.Resources.Internal.Payment as Payment
import Stellar.Resources.Page exposing (Page)
import Stellar.Resources.Payment exposing (Payment)
import Stellar.Sorting as Sorting exposing (Sorting)


{-| Request Builder. Takes the mandatory fields as arguments, the optional fields can be piped using setters.
-}
requestBuilder : Endpoint -> Int -> RequestBuilder Response
requestBuilder endpoint ledgerId =
    HttpBuilder.get (url endpoint ledgerId)
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
        |> withQueryParams [ ( "cursor", cursor ) ]


{-| Set the pagination limit for the Request.
-}
setLimit : Int -> RequestBuilder Response -> RequestBuilder Response
setLimit limit requestBuilder =
    requestBuilder
        |> withQueryParams [ ( "limit", toString limit ) ]


{-| Set the pagination sorting for the Request.
-}
setSorting : Sorting -> RequestBuilder Response -> RequestBuilder Response
setSorting sorting requestBuilder =
    requestBuilder
        |> withQueryParams [ ( "order", Sorting.toString sorting ) ]


url : Endpoint -> Int -> String
url endpoint ledgerId =
    endpoint
        ++ "/ledgers/"
        ++ toString ledgerId
        ++ "/payments"


{-| The Response coming back from the server.
-}
type Response
    = Error Error
    | Success (Page Payment)


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success (Page.decoder Payment.decoder)
        ]
