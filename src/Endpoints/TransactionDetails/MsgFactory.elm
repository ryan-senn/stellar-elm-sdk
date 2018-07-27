module Endpoints.TransactionDetails.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.TransactionDetails.Msg as TransactionDetails


composeMsg : TransactionDetails.Msg -> Msg
composeMsg =
   Endpoints.TransactionDetailsMsg >> Endpoints.composeMsg