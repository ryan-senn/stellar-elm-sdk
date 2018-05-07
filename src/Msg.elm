module Msg exposing (Msg (..))

import Routes exposing (Route)

import Endpoints.Msg as Endpoints


type Msg
    = SetRoute (Maybe Route)
    | EndpointMsg Endpoints.Msg