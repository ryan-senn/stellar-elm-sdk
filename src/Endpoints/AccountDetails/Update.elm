module Endpoints.AccountDetails.Update exposing (update)

import Msg exposing (Msg)

import Stellar.Endpoints.AccountDetails as AccountDetails

import Endpoints.AccountDetails.Msg as AccountDetails
import Endpoints.AccountDetails.MsgFactory as AccountDetails
import Endpoints.AccountDetails.Model as AccountDetails


update : AccountDetails.Msg -> AccountDetails.Model -> (AccountDetails.Model, Cmd Msg)
update msg model =

    case msg of

        AccountDetails.Request endpoint publicKey ->
            { model | isLoading = True } ! [ AccountDetails.request endpoint publicKey (AccountDetails.Response >> AccountDetails.composeMsg) ]

        AccountDetails.Response (Err error) ->
            { model | isLoading = False, response = Just <| Err error } ! []

        AccountDetails.Response (Ok response) ->
            { model | isLoading = False, response = Just <| Ok response } ! []