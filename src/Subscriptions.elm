module Subscriptions exposing (subscriptions)

import Msg exposing (Msg)
import Model exposing (Model)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none