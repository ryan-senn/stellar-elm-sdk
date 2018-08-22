module Stellar.Resources.Effects.AccountFlagsUpdated exposing (AccountFlagsUpdated)

{-| Account Flags updated Effect

# Type alias
@docs AccountFlagsUpdated

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)


{-| Type alias
-}
type alias AccountFlagsUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , authRequired : Bool
    , authRevokable : Bool
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder AccountFlagsUpdated
decoder =
    Decode.decode AccountFlagsUpdated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "auth_required_flag" Decode.bool
        |> Decode.required "auth_revokable_flag" Decode.bool
        |> Decode.required "_links" Links.decoder