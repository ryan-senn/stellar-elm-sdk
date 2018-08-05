module Stellar.Endpoints.TransactionDetails exposing (requestBuilder, send, Response (..))

{-| Transaction Details Endpoint

# Build the Request with required fields
@docs requestBuilder

# Send the Request & catch Response
@docs send, Response

-}

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Endpoint as Endpoint exposing (Endpoint)

import Stellar.Resources.Transaction as Transaction exposing (Transaction)

import Stellar.Error as Error exposing (Error)


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


url : Endpoint -> String -> String
url endpoint hash =

    endpoint ++ "/transactions/" ++ toString hash


{-| The Response coming back from the server.
-}
type Response
    = Error Error
    | Success Transaction


decoder : Decoder Response
decoder =
    Decode.oneOf
        [ Decode.map Error Error.decoder
        , Decode.map Success Transaction.decoder
        ]