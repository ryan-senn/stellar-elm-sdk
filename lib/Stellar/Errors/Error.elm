module Stellar.Error exposing (Error, decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode


type alias Error =
    { type_ : String
    , title : String
    , status : Int
    , detail : String
    , instance : String
    }


decoder : Decoder Error
decoder =
    Decode.decode Error
        |> Decode.required "type" Decode.string
        |> Decode.required "title" Decode.string
        |> Decode.required "status" Decode.int
        |> Decode.required "detail" Decode.string
        |> Decode.required "instance" Decode.string