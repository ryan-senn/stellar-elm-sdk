module Endpoints.Update exposing (update)

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.Model as Endpoints

import Endpoints.AccountDetails.Update as AccountDetails


update : Endpoints.Msg -> Endpoints.Model -> (Endpoints.Model, Cmd Msg)
update msg model =

    case msg of

        Endpoints.AccountDetailsMsg msg ->
            let
                (accountDetailsModel, cmd) =
                    AccountDetails.update msg model.accountDetails

            in
                { model | accountDetails = accountDetailsModel } ! [ cmd ]