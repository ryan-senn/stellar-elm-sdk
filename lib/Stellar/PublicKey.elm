module Stellar.PublicKey exposing (PublicKey, toString, decoder, dummy)

import Json.Decode as Decode exposing (Decoder)


type PublicKey
    = PublicKey String


toString : PublicKey -> String
toString (PublicKey string) =
    string


decoder : Decoder PublicKey
decoder =
    Decode.map PublicKey Decode.string


dummy : PublicKey
dummy =
    PublicKey "GAOEWNUEKXKNGB2AAOX6S6FEP6QKCFTU7KJH647XTXQXTMOAUATX2VF5"