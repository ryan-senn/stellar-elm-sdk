import Html exposing (program)

import Init exposing (init)
import Update exposing (update)
import Subscriptions exposing (subscriptions)
import View exposing (view)
import Msg exposing (Msg)
import Model exposing (Model)


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }