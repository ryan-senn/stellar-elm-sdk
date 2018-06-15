module Stellar.PublicKey exposing (PublicKey, toString, decoder, dummy, fromString)

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
    PublicKey "GBS5K4NW75EVRUHQYMHDEO2CPPHZQ4X5ILAV3ZTLNNYCJAB62Q3N5KCP"


secretKey : String
secretKey =
    "SC67TMWWJJ6WMVXEOKVX4NLBYDSMXEZZXC7ATQFMUO6IGGZZ6ZBFKXD2"


fromString : String -> PublicKey
fromString =
    String.toUpper >> PublicKey