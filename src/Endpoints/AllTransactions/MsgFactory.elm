module Endpoints.AllTransactions.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.AllTransactions.Msg as AllTransactions


composeMsg : AllTransactions.Msg -> Msg
composeMsg =
   Endpoints.AllTransactionsMsg >> Endpoints.composeMsg