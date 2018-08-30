module Stellar.Internal.Error exposing (decoder, standardErrorDecoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Error exposing (Error, StandardError(..))


decoder : Decoder Error
decoder =
    Decode.succeed Error
        |> Decode.required "type" Decode.string
        |> Decode.required "title" Decode.string
        |> Decode.required "status" Decode.int
        |> Decode.required "detail" Decode.string
        |> Decode.optional "instance" (Decode.maybe Decode.string) Nothing


{-| Decoder
-}
standardErrorDecoder : Decoder StandardError
standardErrorDecoder =
    Decode.andThen standardErrorFromStatus decoder


standardErrorFromStatus : Error -> Decoder StandardError
standardErrorFromStatus error =
    case error.status of
        403 ->
            Decode.succeed <| Forbidden error

        429 ->
            Decode.succeed <| RateLimitExceeded error

        500 ->
            Decode.succeed <| ServerError error

        _ ->
            Decode.fail "Could not decode standard error"
