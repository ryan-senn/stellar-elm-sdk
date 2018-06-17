module Endpoints.OperationsForAccount.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.OperationsForAccount.Msg as OperationsForAccount


composeMsg : OperationsForAccount.Msg -> Msg
composeMsg =
   Endpoints.OperationsForAccountMsg >> Endpoints.composeMsg