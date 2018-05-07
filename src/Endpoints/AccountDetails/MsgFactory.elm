module Endpoints.AccountDetails.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.AccountDetails.Msg as AccountDetails


composeMsg : AccountDetails.Msg -> Msg
composeMsg =
   Endpoints.AccountDetailsMsg >> Endpoints.composeMsg