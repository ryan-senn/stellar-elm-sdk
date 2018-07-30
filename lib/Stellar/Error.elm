module Stellar.Error exposing (Error, decoder, StandardError, standardErrorDecoder, flattenError)

{-| Record representing possible Errors in Stellar

# Type alias and Decoder
@docs Error, decoder

# Standard Errors
@docs StandardError, standardErrorDecoder

# Utility
@docs flattenError

-}

import Http

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


{-| Type alias
-}
type alias Error =
    { type_ : String
    , title : String
    , status : Int
    , detail : String
    , instance : Maybe String
    }


{-| Decoder
-}
decoder : Decoder Error
decoder =
    Decode.decode Error
        |> Decode.required "type" Decode.string
        |> Decode.required "title" Decode.string
        |> Decode.required "status" Decode.int
        |> Decode.required "detail" Decode.string
        |> Decode.optional "instance" (Decode.maybe Decode.string) Nothing


{-| Union Type representing the Standard Errors in Stellar
-}
type StandardError
    = ServerError Error
    | RateLimitExceeded Error
    | Forbidden Error


{-| Decoder
-}
standardErrorDecoder : Decoder StandardError
standardErrorDecoder =
    Decode.andThen standardErrorFromStatus decoder


standardErrorFromStatus : Error -> Decoder StandardError
standardErrorFromStatus error =

    case error.status of
        403 -> Decode.succeed <| Forbidden error
        429 -> Decode.succeed <| RateLimitExceeded error
        500 -> Decode.succeed <| ServerError error
        _ -> Decode.fail "Could not decode standard error"


{-| Utility to flatten Errors. In Elm, Http requests return a `Result Http.Error response`.
When Stellar throws an Error, Elm interprets it as `Err (Http.BadStatus response)`.
We then need to at the response body and check for status code to return the correct Err.
-}
flattenError : Http.Error -> (Error -> response) -> Result Http.Error response
flattenError httpError ok =

    case httpError of
        Http.BadStatus response ->
            case Decode.decodeString decoder response.body of
                Ok error ->
                    Ok (ok error)

                Err _ ->
                    Err httpError

        _ ->
            Err httpError