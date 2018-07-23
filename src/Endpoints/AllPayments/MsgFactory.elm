module Endpoints.AllPayments.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.AllPayments.Msg as AllPayments


composeMsg : AllPayments.Msg -> Msg
composeMsg =
   Endpoints.AllPaymentsMsg >> Endpoints.composeMsg