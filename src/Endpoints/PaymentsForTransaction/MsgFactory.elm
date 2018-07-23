module Endpoints.PaymentsForTransaction.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.PaymentsForTransaction.Msg as PaymentsForTransaction


composeMsg : PaymentsForTransaction.Msg -> Msg
composeMsg =
   Endpoints.PaymentsForTransactionMsg >> Endpoints.composeMsg