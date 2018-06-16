module Endpoints.DataForAccount.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.DataForAccount.Msg as DataForAccount


composeMsg : DataForAccount.Msg -> Msg
composeMsg =
   Endpoints.DataForAccountMsg >> Endpoints.composeMsg