module Endpoints.LedgerDetails.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.LedgerDetails.Msg as LedgerDetails


composeMsg : LedgerDetails.Msg -> Msg
composeMsg =
   Endpoints.LedgerDetailsMsg >> Endpoints.composeMsg