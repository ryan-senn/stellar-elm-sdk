module Endpoints.EffectsForTransaction.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.EffectsForTransaction.Msg as EffectsForTransaction


composeMsg : EffectsForTransaction.Msg -> Msg
composeMsg =
   Endpoints.EffectsForTransactionMsg >> Endpoints.composeMsg