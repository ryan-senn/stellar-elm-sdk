module Init exposing (init)

import Navigation exposing (Location)

import Msg exposing (Msg)
import Model exposing (Model, initialModel)
import Update

import Routes


init : Location -> (Model, Cmd Msg)
init location =

    initialModel
        |> Update.setRoute (Routes.fromLocation location)