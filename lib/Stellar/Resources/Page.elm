module Stellar.Resources.Page exposing (Page, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)


{-| Type alias
-}
type alias Page a =
    { embedded_ : { records : List a }
    , links_ : Links
    }


{-| Decoder
-}
decoder : Decoder record -> Decoder (Page record)
decoder recordDecoder =
    Decode.decode Page
        |> Decode.required "_embedded" (embeddedDecoder recordDecoder)
        |> Decode.required "_links" linksDecoder


{-| Type alias
-}
type alias Embed a =
    { records : List a
    }


embeddedDecoder : Decoder record -> Decoder (Embed record)
embeddedDecoder recordDecoder =
    Decode.decode Embed
        |> Decode.required "records" (Decode.list recordDecoder)


{-| Links
-}
type alias Links =
    { self : Link
    , prev : Link
    , next : Link
    }


{-| Links decoder
-}
linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "prev" Link.decoder
        |> Decode.required "next" Link.decoder