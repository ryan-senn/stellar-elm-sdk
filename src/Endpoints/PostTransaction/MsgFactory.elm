module Endpoints.PostTransaction.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.PostTransaction.Msg as PostTransaction


composeMsg : PostTransaction.Msg -> Msg
composeMsg =
   Endpoints.PostTransactionMsg >> Endpoints.composeMsg