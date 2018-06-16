module Endpoints.Update exposing (update)

import Form.Input as Input

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.Model as Endpoints

import Endpoints.AccountDetails.Update as AccountDetails
import Endpoints.AllAssets.Update as AllAssets
import Endpoints.DataForAccount.Update as DataForAccount


update : Endpoints.Msg -> Endpoints.Model -> (Endpoints.Model, Cmd Msg)
update msg model =

    case msg of
        Endpoints.UpdateEndpoint inputMsg ->
            { model | endpoint = Input.update inputMsg model.endpoint } ! []

        Endpoints.AccountDetailsMsg msg ->
            let
                (accountDetailsModel, cmd) =
                    AccountDetails.update msg model.accountDetails

            in
                { model | accountDetails = accountDetailsModel } ! [ cmd ]

        Endpoints.AllAssetsMsg msg ->
            let
                (allAssetsModel, cmd) =
                    AllAssets.update msg model.allAssets

            in
                { model | allAssets = allAssetsModel } ! [ cmd ]

        Endpoints.DataForAccountMsg msg ->
            let
                (dataForAccountModel, cmd) =
                    DataForAccount.update msg model.dataForAccount

            in
                { model | dataForAccount = dataForAccountModel } ! [ cmd ]