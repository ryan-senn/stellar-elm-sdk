module Init exposing (init)

import Msg exposing (Msg)
import Model exposing (Model, initialModel)


init : (Model, Cmd Msg)
init =
    initialModel ! []