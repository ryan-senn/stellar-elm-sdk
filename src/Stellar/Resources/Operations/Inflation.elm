module Stellar.Resources.Operations.Inflation exposing (Inflation, decoder)

{-| Inflation Operation

# Type alias and decoder
@docs Inflation, decoder

-}

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Operations.Links as Links exposing (Links)


{-| Type alias
-}
type alias Inflation =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder Inflation
decoder =
    Decode.decode Inflation
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.date
        |> Decode.required "transaction_hash" Decode.string
        |> Decode.required "_links" Links.decoder