module Stellar.Resources.Effects.AccountThresholdsUpdated exposing (AccountThresholdsUpdated, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.Links as Links exposing (Links)


{-| Type alias
-}
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


{-| Decoder
-}
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
        |> Decode.required "_links" Links.decoder