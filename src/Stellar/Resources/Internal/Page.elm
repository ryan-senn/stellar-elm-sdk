module Stellar.Resources.Internal.Page exposing (decoder, embeddedDecoder, linksDecoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Internal.Link as Link
import Stellar.Resources.Page exposing (Embed, Links, Page)


decoder : Decoder record -> Decoder (Page record)
decoder recordDecoder =
    Decode.decode Page
        |> Decode.required "_embedded" (embeddedDecoder recordDecoder)
        |> Decode.required "_links" linksDecoder


embeddedDecoder : Decoder record -> Decoder (Embed record)
embeddedDecoder recordDecoder =
    Decode.decode Embed
        |> Decode.required "records" (Decode.list recordDecoder)


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "prev" Link.decoder
        |> Decode.required "next" Link.decoder
