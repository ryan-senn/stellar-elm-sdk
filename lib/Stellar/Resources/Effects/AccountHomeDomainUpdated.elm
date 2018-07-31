module Stellar.Resources.Effects.AccountHomeDomainUpdated exposing (AccountHomeDomainUpdated, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)


type alias AccountHomeDomainUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , homeDomain : String
    , links : Links
    }


decoder : Decoder AccountHomeDomainUpdated
decoder =
    Decode.decode AccountHomeDomainUpdated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "home_domain" Decode.string
        |> Decode.required "_links" Links.decoder