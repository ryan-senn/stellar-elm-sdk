module Endpoints.TransactionsForLedger.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.TransactionsForLedger.Msg as TransactionsForLedger


composeMsg : TransactionsForLedger.Msg -> Msg
composeMsg =
   Endpoints.TransactionsForLedgerMsg >> Endpoints.composeMsg