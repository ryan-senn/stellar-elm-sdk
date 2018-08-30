module Stellar.Resources.Effects.Internal.Links exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Internal.Link as Link
import Stellar.Resources.Effects.Links exposing (Links)


decoder : Decoder Links
decoder =
    Decode.succeed Links
        |> Decode.required "operation" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder
