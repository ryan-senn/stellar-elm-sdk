module Endpoints.EffectsForAccount.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.EffectsForAccount.Msg as EffectsForAccount


composeMsg : EffectsForAccount.Msg -> Msg
composeMsg =
   Endpoints.EffectsForAccountMsg >> Endpoints.composeMsg