module Stellar.Resources.Operations.Payment exposing (Payment, decoder)

{-| Payment Operation

# Type alias and decoder
@docs Payment, decoder

-}

import Date exposing (Date)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Extra as Decode
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Operations.Links as Links exposing (Links)


{-| Type alias
-}
type alias Payment =
    { id : String
    , pagingToken : String
    , sourceAccount : String
    , type_ : String
    , typeI : Int
    , createdAt : Date
    , transactionHash : String
    , from : String
    , to : String
    , amount : String
    , links : Links
    }


{-| Decoder
-}
decoder : Decoder Payment
decoder =
    Decode.decode Payment
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "source_account" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "created_at" Decode.date
        |> Decode.required "transaction_hash" Decode.string
        |> Decode.required "from" Decode.string
        |> Decode.required "to" Decode.string
        |> Decode.required "amount" Decode.string
        |> Decode.required "_links" Links.decoder