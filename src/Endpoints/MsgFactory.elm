module Endpoints.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints


composeMsg : Endpoints.Msg -> Msg
composeMsg msg =
    Msg.EndpointMsg msg