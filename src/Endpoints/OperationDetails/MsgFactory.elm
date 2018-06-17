module Endpoints.OperationDetails.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.OperationDetails.Msg as OperationDetails


composeMsg : OperationDetails.Msg -> Msg
composeMsg =
   Endpoints.OperationDetailsMsg >> Endpoints.composeMsg