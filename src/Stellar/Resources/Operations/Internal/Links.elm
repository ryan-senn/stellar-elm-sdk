module Stellar.Resources.Operations.Internal.Links exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Internal.Link as Link
import Stellar.Resources.Operations.Links exposing (Links)


decoder : Decoder Links
decoder =
    Decode.decode Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder
        |> Decode.required "effects" Link.decoder
        |> Decode.required "transaction" Link.decoder
