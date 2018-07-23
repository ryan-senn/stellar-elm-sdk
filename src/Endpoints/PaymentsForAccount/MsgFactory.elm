module Endpoints.PaymentsForAccount.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.PaymentsForAccount.Msg as PaymentsForAccount


composeMsg : PaymentsForAccount.Msg -> Msg
composeMsg =
   Endpoints.PaymentsForAccountMsg >> Endpoints.composeMsg