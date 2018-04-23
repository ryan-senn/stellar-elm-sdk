module Http.Accounts exposing (requestSingleAccount)

import Types exposing (PublicKey)

import Msg exposing (Msg)


requestSingleAccount : PublicKey -> Cmd Msg
requestSingleAccount publicKey =
    Cmd.none