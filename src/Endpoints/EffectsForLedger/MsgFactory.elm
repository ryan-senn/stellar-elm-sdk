module Endpoints.EffectsForLedger.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.EffectsForLedger.Msg as EffectsForLedger


composeMsg : EffectsForLedger.Msg -> Msg
composeMsg =
   Endpoints.EffectsForLedgerMsg >> Endpoints.composeMsg