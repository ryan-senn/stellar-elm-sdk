module Endpoints.EffectsForOperation.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.EffectsForOperation.Msg as EffectsForOperation


composeMsg : EffectsForOperation.Msg -> Msg
composeMsg =
   Endpoints.EffectsForOperationMsg >> Endpoints.composeMsg