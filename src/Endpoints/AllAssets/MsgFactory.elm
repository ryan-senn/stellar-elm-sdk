module Endpoints.AllAssets.MsgFactory exposing (composeMsg)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.MsgFactory as Endpoints

import Endpoints.AllAssets.Msg as AllAssets


composeMsg : AllAssets.Msg -> Msg
composeMsg =
   Endpoints.AllAssetsMsg >> Endpoints.composeMsg