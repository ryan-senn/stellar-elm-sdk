module Endpoints.FindPaymentPaths.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.FindPaymentPaths.Msg as FindPaymentPaths


composeMsg : FindPaymentPaths.Msg -> Msg
composeMsg =
   Endpoints.FindPaymentPathsMsg >> Endpoints.composeMsg