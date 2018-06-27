module Stellar.Resources.Effects.AccountThresholdsUpdated exposing (AccountThresholdsUpdated, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Link as Link exposing (Link)


type alias AccountThresholdsUpdated =
    { id : String
    , pagingToken : String
    , type_ : String
    , typeI : Int
    , account : String
    , lowThreshold : Int
    , medThreshold : Int
    , highThreshold : Int
    , links : Links
    }


decoder : Decoder AccountThresholdsUpdated
decoder =
    Decode.decode AccountThresholdsUpdated
        |> Decode.required "id" Decode.string
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "type" Decode.string
        |> Decode.required "type_i" Decode.int
        |> Decode.required "account" Decode.string
        |> Decode.required "low_threshold" Decode.int
        |> Decode.required "mid_threshold" Decode.int
        |> Decode.required "high_threshold" Decode.int
        |> Decode.required "_links" linksDecoder


type alias Links =
    { operation : Link
    , succeeds : Link
    , precedes : Link
    }


linksDecoder : Decoder Links
linksDecoder =
    Decode.decode Links
        |> Decode.required "operation" Link.decoder
        |> Decode.required "succeeds" Link.decoder
        |> Decode.required "precedes" Link.decoder