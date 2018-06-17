module Endpoints.OperationsForLedger.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.OperationsForLedger.Msg as OperationsForLedger


composeMsg : OperationsForLedger.Msg -> Msg
composeMsg =
   Endpoints.OperationsForLedgerMsg >> Endpoints.composeMsg