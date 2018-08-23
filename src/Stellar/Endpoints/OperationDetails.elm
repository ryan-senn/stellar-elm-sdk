module Stellar.Endpoints.OperationDetails exposing (requestBuilder, send, Response (..))

{-| Operations Details Endpoint

# Build the Request with required fields
@docs requestBuilder

# Send the Request & catch Response
@docs send, Response

-}

import Http
import HttpBuilder exposing (..)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Endpoint as Endpoint exposing (Endpoint)

import Stellar.Resources.Operation exposing (Operation)
import Stellar.Resources.Internal.Operation as Operation

import Stellar.Error exposing (Error)
import Stellar.Internal.Error as Error


{-| Request Builder. Takes the mandatory fields as arguments, the optional fields can be piped using setters.
-}
requestBuilder : Endpoint -> Int -> RequestBuilder Response
requestBuilder endpoint operationId =

    HttpBuilder.get (url endpoint operationId)
        |> withExpect (Http.expectJson decoder)


{-| Send the request once configured.
-}
send : (Result Http.Error Response -> msg) -> RequestBuilder Response -> Cmd msg
send =
    HttpBuilder.send


url : Endpoint -> Int -> String
url endpoint operationId =

    endpoint ++ "/operations/" ++ toString operationId


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