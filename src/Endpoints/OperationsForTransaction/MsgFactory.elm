module Endpoints.OperationsForTransaction.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.OperationsForTransaction.Msg as OperationsForTransaction


composeMsg : OperationsForTransaction.Msg -> Msg
composeMsg =
   Endpoints.OperationsForTransactionMsg >> Endpoints.composeMsg