module Stellar.Resources.Page exposing
    ( Page, decoder
    , Embed, Links
    )

{-| Page Resource

# Type alias and decoder
@docs Page, decoder, Embed, Links

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)


{-| Type alias

A Page can contain any embedded Resources and links for navigation.

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


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "self" Link.decoder
        |> Decode.required "prev" Link.decoder
        |> Decode.required "next" Link.decoder