module Stellar.PublicKey exposing (PublicKey (PublicKey), toString, fromString, decoder)

import Json.Decode as Decode exposing (Decoder)


type PublicKey
    = PublicKey String


toString : PublicKey -> String
toString (PublicKey string) =
    string


fromString : String -> PublicKey
fromString =
    String.toUpper >> PublicKey


decoder : Decoder PublicKey
decoder =
    Decode.map PublicKey Decode.string