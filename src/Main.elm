import Navigation exposing (program)

import Init exposing (init)
import Update exposing (update)
import Subscriptions exposing (subscriptions)
import View exposing (view)
import Msg exposing (Msg (SetRoute))
import Model exposing (Model)
import Routes

import Html.Styled as Html


main : Program Never Model Msg
main =
    program (Routes.fromLocation >> SetRoute)
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view >> Html.toUnstyled
        }