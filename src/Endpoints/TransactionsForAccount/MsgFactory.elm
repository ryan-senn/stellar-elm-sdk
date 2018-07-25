module Endpoints.TransactionsForAccount.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.TransactionsForAccount.Msg as TransactionsForAccount


composeMsg : TransactionsForAccount.Msg -> Msg
composeMsg =
   Endpoints.TransactionsForAccountMsg >> Endpoints.composeMsg