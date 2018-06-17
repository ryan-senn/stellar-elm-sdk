module Endpoints.OrderbookDetails.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.OrderbookDetails.Msg as OrderbookDetails


composeMsg : OrderbookDetails.Msg -> Msg
composeMsg =
   Endpoints.OrderbookDetailsMsg >> Endpoints.composeMsg