module Update exposing (update, setRoute)

import Stellar.Http.Accounts as StellarAccounts

import Msg exposing (Msg (..))
import Model exposing (Model)

import Routes exposing (Route (..), Endpoint (..))


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =

    case msg of

        SetRoute route ->
            setRoute route model

        AccountRequest endpoint publicKey ->
            model ! [ StellarAccounts.request endpoint publicKey AccountResponse ]

        AccountResponse (Err error) ->
            { model | accountResponse = Just (Err error) } ! []

        AccountResponse (Ok requestSingleAccountResponse) ->
            { model | accountResponse = Just (Ok requestSingleAccountResponse) } ! []


setRoute : Maybe Route -> Model -> (Model, Cmd Msg)
setRoute route model =

    case route of

        Nothing ->
            { model | route = Nothing } ! []

        Just Home ->
            { model | route = Just Home } ! []

        Just (Endpoints AccountDetails) ->
            { model | route = Just <| Endpoints AccountDetails } ! []

        Just (Endpoints AllAssets) ->
            { model | route = Just <| Endpoints AllAssets } ! []