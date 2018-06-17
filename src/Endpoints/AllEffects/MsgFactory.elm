module Endpoints.AllEffects.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.AllEffects.Msg as AllEffects


composeMsg : AllEffects.Msg -> Msg
composeMsg =
   Endpoints.AllEffectsMsg >> Endpoints.composeMsg