module Endpoints.PaymentsForLedger.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.PaymentsForLedger.Msg as PaymentsForLedger


composeMsg : PaymentsForLedger.Msg -> Msg
composeMsg =
   Endpoints.PaymentsForLedgerMsg >> Endpoints.composeMsg