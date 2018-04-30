module Routes exposing (Route (..), Endpoint (..), fromLocation, href, modifyUrl, isActiveRoute)

import Html.Styled exposing (Attribute)
import Html.Styled.Attributes as Attributes

import Navigation exposing (Location)

import UrlParser as Url exposing ((</>), Parser)


type Route
    = Home
    | Endpoints Endpoint


type Endpoint
    = AccountDetails
    | AllAssets
    | DataForAccount
    | AllEffects
    | EffectsForAccount
    | EffectsForLedger
    | EffectsForOperation
    | EffectsForTransaction
    | AllLedgers
    | LedgerDetails
    | OffersForAccount
    | AllOperations
    | OperationsForAccount
    | OperationsForLedger
    | OperationsForTransaction
    | OperationDetails
    | OrderbookDetails
    | FindPaymentPaths
    | AllPayments
    | PaymentsForAccount
    | PaymentsForLedger
    | PaymentsForTransaction
    | TradeAggregations
    | Trades
    | AllTransactions
    | PostTransaction
    | TransactionsForAccount
    | TransactionsForLedger
    | TransactionDetails


route : Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home (Url.s "")
        , Url.map (Endpoints AccountDetails) (Url.s "endpoints" </> Url.s "account-details")
        , Url.map (Endpoints AllAssets) (Url.s "endpoints" </> Url.s "all-assets")
        , Url.map (Endpoints DataForAccount) (Url.s "endpoints" </> Url.s "data-for-account")
        , Url.map (Endpoints AllEffects) (Url.s "endpoints" </> Url.s "all-effects")
        , Url.map (Endpoints EffectsForAccount) (Url.s "endpoints" </> Url.s "effects-for-account")
        , Url.map (Endpoints EffectsForLedger) (Url.s "endpoints" </> Url.s "effects-for-ledger")
        , Url.map (Endpoints EffectsForOperation) (Url.s "endpoints" </> Url.s "effects-for-operation")
        , Url.map (Endpoints EffectsForTransaction) (Url.s "endpoints" </> Url.s "effects-for-transaction")
        , Url.map (Endpoints AllLedgers) (Url.s "endpoints" </> Url.s "all-ledgers")
        , Url.map (Endpoints LedgerDetails) (Url.s "endpoints" </> Url.s "ledger-details")
        , Url.map (Endpoints OffersForAccount) (Url.s "endpoints" </> Url.s "offers-for-account")
        , Url.map (Endpoints AllOperations) (Url.s "endpoints" </> Url.s "all-operations")
        , Url.map (Endpoints OperationsForAccount) (Url.s "endpoints" </> Url.s "operations-for-account")
        , Url.map (Endpoints OperationsForLedger) (Url.s "endpoints" </> Url.s "operations-for-ledger")
        , Url.map (Endpoints OperationsForTransaction) (Url.s "endpoints" </> Url.s "operations-for-transaction")
        , Url.map (Endpoints OperationDetails) (Url.s "endpoints" </> Url.s "operation-details")
        , Url.map (Endpoints OrderbookDetails) (Url.s "endpoints" </> Url.s "orderbook-details")
        , Url.map (Endpoints FindPaymentPaths) (Url.s "endpoints" </> Url.s "find-payment-paths")
        , Url.map (Endpoints AllPayments) (Url.s "endpoints" </> Url.s "all-payments")
        , Url.map (Endpoints PaymentsForAccount) (Url.s "endpoints" </> Url.s "payments-for-account")
        , Url.map (Endpoints PaymentsForLedger) (Url.s "endpoints" </> Url.s "payments-for-ledger")
        , Url.map (Endpoints PaymentsForTransaction) (Url.s "endpoints" </> Url.s "payments-for-transaction")
        , Url.map (Endpoints TradeAggregations) (Url.s "endpoints" </> Url.s "trade-aggregations")
        , Url.map (Endpoints Trades) (Url.s "endpoints" </> Url.s "trades")
        , Url.map (Endpoints AllTransactions) (Url.s "endpoints" </> Url.s "all-transactions")
        , Url.map (Endpoints PostTransaction) (Url.s "endpoints" </> Url.s "post-transaction")
        , Url.map (Endpoints TransactionsForAccount) (Url.s "endpoints" </> Url.s "transactions-for-account")
        , Url.map (Endpoints TransactionsForLedger) (Url.s "endpoints" </> Url.s "transactions-for-ledger")
        , Url.map (Endpoints TransactionDetails) (Url.s "endpoints" </> Url.s "transaction-details")
        ]


routeToString : Route -> String
routeToString page =

    case page of

        Home ->
            "#/"

        Endpoints AccountDetails ->
            "#/endpoints/account-details"

        Endpoints AllAssets ->
            "#/endpoints/all-assets"

        Endpoints DataForAccount ->
            "#/endpoints/data-for-account"

        Endpoints AllEffects ->
            "#/endpoints/all-effects"

        Endpoints EffectsForAccount ->
            "#/endpoints/effects-for-account"

        Endpoints EffectsForLedger ->
            "#/endpoints/effects-for-ledger"

        Endpoints EffectsForOperation ->
            "#/endpoints/effects-for-operation"

        Endpoints EffectsForTransaction ->
            "#/endpoints/effects-for-transaction"

        Endpoints AllLedgers ->
            "#/endpoints/all-ledgers"

        Endpoints LedgerDetails ->
            "#/endpoints/ledger-details"

        Endpoints OffersForAccount ->
            "#/endpoints/offers-for-account"

        Endpoints AllOperations ->
            "#/endpoints/all-operations"

        Endpoints OperationsForAccount ->
            "#/endpoints/operations-for-account"

        Endpoints OperationsForLedger ->
            "#/endpoints/operations-for-ledger"

        Endpoints OperationsForTransaction ->
            "#/endpoints/operations-for-transaction"

        Endpoints OperationDetails ->
            "#/endpoints/operation-details"

        Endpoints OrderbookDetails ->
            "#/endpoints/orderbook-details"

        Endpoints FindPaymentPaths ->
            "#/endpoints/find-payment-paths"

        Endpoints AllPayments ->
            "#/endpoints/all-payments"

        Endpoints PaymentsForAccount ->
            "#/endpoints/payments-for-account"

        Endpoints PaymentsForLedger ->
            "#/endpoints/payments-for-ledger"

        Endpoints PaymentsForTransaction ->
            "#/endpoints/payments-for-transaction"

        Endpoints TradeAggregations ->
            "#/endpoints/trade-aggregations"

        Endpoints Trades ->
            "#/endpoints/trades"

        Endpoints AllTransactions ->
            "#/endpoints/all-transactions"

        Endpoints PostTransaction ->
            "#/endpoints/post-transaction"

        Endpoints TransactionsForAccount ->
            "#/endpoints/transactions-for-account"

        Endpoints TransactionsForLedger ->
            "#/endpoints/transactions-for-ledger"

        Endpoints TransactionDetails ->
            "#/endpoints/transaction-details"


href : Route -> Attribute msg
href route =
    Attributes.href (routeToString route)


modifyUrl : Route -> Cmd msg
modifyUrl =
    routeToString >> Navigation.modifyUrl


fromLocation : Location -> Maybe Route
fromLocation location =
    if String.isEmpty location.hash then
        Just Home
    else
        Url.parseHash route location


isActiveRoute : Maybe Route -> Route -> Bool
isActiveRoute mRoute route =
    mRoute == Just route