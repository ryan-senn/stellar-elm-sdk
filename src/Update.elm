module Update exposing (update, setRoute)

import Stellar.Endpoints.AccountDetails as AccountDetails
import Stellar.Endpoints.AllAssets as AllAssets

import Msg exposing (Msg (..))
import Model exposing (Model)

import Routes exposing (Route (..), Endpoint (..))


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =

    case msg of

        SetRoute route ->
            setRoute route model

        AccountRequest endpoint publicKey ->
            model ! [ AccountDetails.request endpoint publicKey AccountResponse ]

        AccountResponse (Err error) ->
            { model | accountResponse = Just (Err error) } ! []

        AccountResponse (Ok requestSingleAccountResponse) ->
            { model | accountResponse = Just (Ok requestSingleAccountResponse) } ! []

        AllAssetsRequest endpoint ->
            model ! [ AllAssets.request endpoint AllAssetsResponse ]

        AllAssetsResponse (Err error) ->
            { model | allAssetsResponse = Just (Err error) } ! []

        AllAssetsResponse (Ok requestAllAssetsResponse) ->
            { model | allAssetsResponse = Just (Ok requestAllAssetsResponse) } ! []


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

        Just (Endpoints DataForAccount) ->
            { model | route = Just <| Endpoints DataForAccount } ! []

        Just (Endpoints AllEffects) ->
            { model | route = Just <| Endpoints AllEffects } ! []

        Just (Endpoints EffectsForAccount) ->
            { model | route = Just <| Endpoints EffectsForAccount } ! []

        Just (Endpoints EffectsForLedger) ->
            { model | route = Just <| Endpoints EffectsForLedger } ! []

        Just (Endpoints EffectsForOperation) ->
            { model | route = Just <| Endpoints EffectsForOperation } ! []

        Just (Endpoints EffectsForTransaction) ->
            { model | route = Just <| Endpoints EffectsForTransaction } ! []

        Just (Endpoints AllLedgers) ->
            { model | route = Just <| Endpoints AllLedgers } ! []

        Just (Endpoints LedgerDetails) ->
            { model | route = Just <| Endpoints LedgerDetails } ! []

        Just (Endpoints OffersForAccount) ->
            { model | route = Just <| Endpoints OffersForAccount } ! []

        Just (Endpoints AllOperations) ->
            { model | route = Just <| Endpoints AllOperations } ! []

        Just (Endpoints OperationsForAccount) ->
            { model | route = Just <| Endpoints OperationsForAccount } ! []

        Just (Endpoints OperationsForLedger) ->
            { model | route = Just <| Endpoints OperationsForLedger } ! []

        Just (Endpoints OperationsForTransaction) ->
            { model | route = Just <| Endpoints OperationsForTransaction } ! []

        Just (Endpoints OperationDetails) ->
            { model | route = Just <| Endpoints OperationDetails } ! []

        Just (Endpoints OrderbookDetails) ->
            { model | route = Just <| Endpoints OrderbookDetails } ! []

        Just (Endpoints FindPaymentPaths) ->
            { model | route = Just <| Endpoints FindPaymentPaths } ! []

        Just (Endpoints AllPayments) ->
            { model | route = Just <| Endpoints AllPayments } ! []

        Just (Endpoints PaymentsForAccount) ->
            { model | route = Just <| Endpoints PaymentsForAccount } ! []

        Just (Endpoints PaymentsForLedger) ->
            { model | route = Just <| Endpoints PaymentsForLedger } ! []

        Just (Endpoints PaymentsForTransaction) ->
            { model | route = Just <| Endpoints PaymentsForTransaction } ! []

        Just (Endpoints TradeAggregations) ->
            { model | route = Just <| Endpoints TradeAggregations } ! []

        Just (Endpoints Trades) ->
            { model | route = Just <| Endpoints Trades } ! []

        Just (Endpoints AllTransactions) ->
            { model | route = Just <| Endpoints AllTransactions } ! []

        Just (Endpoints PostTransaction) ->
            { model | route = Just <| Endpoints PostTransaction } ! []

        Just (Endpoints TransactionsForAccount) ->
            { model | route = Just <| Endpoints TransactionsForAccount } ! []

        Just (Endpoints TransactionsForLedger) ->
            { model | route = Just <| Endpoints TransactionsForLedger } ! []

        Just (Endpoints TransactionDetails) ->
            { model | route = Just <| Endpoints TransactionDetails } ! []