module Endpoints.AllOperations.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.AllOperations.Msg as AllOperations


composeMsg : AllOperations.Msg -> Msg
composeMsg =
   Endpoints.AllOperationsMsg >> Endpoints.composeMsg