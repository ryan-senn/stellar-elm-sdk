module Endpoints.OffersForAccount.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.OffersForAccount.Msg as OffersForAccount


composeMsg : OffersForAccount.Msg -> Msg
composeMsg =
   Endpoints.OffersForAccountMsg >> Endpoints.composeMsg