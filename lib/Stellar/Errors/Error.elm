module Stellar.Errors.Error exposing (Error, decoder, StandardError, standardErrorDecoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Error =
    { type_ : String
    , title : String
    , status : Int
    , detail : String
    , instance : String
    }


decoder : Decoder Error
decoder =
    Decode.decode Error
        |> Decode.required "type" Decode.string
        |> Decode.required "title" Decode.string
        |> Decode.required "status" Decode.int
        |> Decode.required "detail" Decode.string
        |> Decode.required "instance" Decode.string


type StandardError
    = ServerError Error
    | RateLimitExceeded Error
    | Forbidden Error


standardErrorDecoder : Decoder StandardError
standardErrorDecoder =
    decoder
        |> Decode.andThen standardErrorFromStatus


standardErrorFromStatus : Error -> Decoder StandardError
standardErrorFromStatus error =

    case error.status of
        403 -> Decode.succeed <| Forbidden error
        429 -> Decode.succeed <| RateLimitExceeded error
        500 -> Decode.succeed <| ServerError error
        _ -> Decode.fail "Could not decode standard error"