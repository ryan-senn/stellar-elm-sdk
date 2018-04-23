module Update exposing (update)

import Stellar.Http.Accounts as StellarAccounts

import Msg exposing (Msg (..))
import Model exposing (Model)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =

    case msg of

        AccountRequest endpoint publicKey ->
            model ! [ StellarAccounts.requestSingleAccount endpoint publicKey AccountResponse ]

        AccountResponse (Err error) ->
            { model | accountResponse = Just (Err error) } ! []

        AccountResponse (Ok requestSingleAccountResponse) ->
            { model | accountResponse = Just (Ok requestSingleAccountResponse) } ! []