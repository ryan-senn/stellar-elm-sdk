module Endpoints.AllLedgers.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.AllLedgers.Msg as AllLedgers


composeMsg : AllLedgers.Msg -> Msg
composeMsg =
   Endpoints.AllLedgersMsg >> Endpoints.composeMsg