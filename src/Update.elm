module Update exposing (update, setRoute)

import Stellar.Endpoints.AccountDetails as AccountDetails
import Stellar.Endpoints.AllAssets as AllAssets
import Stellar.Endpoints.DataForAccount as DataForAccount

import Msg exposing (Msg (..))
import Model exposing (Model)

import Routes exposing (Route (..))
import Endpoints exposing (Endpoint (..))

import Endpoints.Update as Endpoints


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =

    case msg of

        SetRoute route ->
            setRoute route model

        EndpointMsg msg ->
            let
                (endpointsModel, cmd) =
                    Endpoints.update msg model.endpoints

            in
                { model | endpoints = endpointsModel } ! [ cmd ]


setRoute : Maybe Route -> Model -> (Model, Cmd Msg)
setRoute route model =

    case route of

        Nothing ->
            { model | route = Nothing } ! []

        Just Home ->
            { model | route = Just Home } ! []

        Just (Endpoints endpoint) ->
            { model | route = Just <| Endpoints endpoint } ! []