import Navigation exposing (program)

import Html.Styled as Html

import Update exposing (update)
import View exposing (view)
import Msg exposing (Msg (SetRoute))
import Model exposing (Model, initialModel)

import Routes


main : Program Never Model Msg
main =
    program (Routes.fromLocation >> SetRoute)
        { init = (\location -> Update.setRoute (Routes.fromLocation location) initialModel)
        , update = update
        , subscriptions = always Sub.none
        , view = view >> Html.toUnstyled
        }