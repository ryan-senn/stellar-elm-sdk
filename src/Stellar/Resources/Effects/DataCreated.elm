module Stellar.Resources.Effects.DataCreated exposing (DataCreated)

{-| Data created Effect

# Type alias
@docs DataCreated

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)


{-| Type alias
-}
type alias DataCreated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder DataCreated
decoder =
    Decode.decode DataCreated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "_links" Links.decoder