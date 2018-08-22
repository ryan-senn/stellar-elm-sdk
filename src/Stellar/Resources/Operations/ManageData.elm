module Stellar.Resources.Operations.ManageData exposing (ManageData)

{-| Manage Data Operation

# Type alias
@docs ManageData

-}

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Operations.Links as Links exposing (Links)


{-| Type alias
-}
type alias ManageData =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , name : String
    , value : String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder ManageData
decoder =
    Decode.decode ManageData
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.date
        |> Decode.required "transaction_hash" Decode.string
        |> Decode.required "name" Decode.string
        |> Decode.required "value" Decode.string
        |> Decode.required "_links" Links.decoder