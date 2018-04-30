module Routes exposing (Route (..), Endpoint (..), endpointList, fromLocation, href, modifyUrl, isActiveRoute)

import Html.Styled exposing (Attribute)
import Html.Styled.Attributes as Attributes

import Navigation exposing (Location)

import UrlParser as Url exposing ((</>), Parser)

import Helpers.String as String


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


endpointList : List Endpoint
endpointList =
    [ AccountDetails
    , AllAssets
    , DataForAccount
    , AllEffects
    , EffectsForAccount
    , EffectsForLedger
    , EffectsForOperation
    , EffectsForTransaction
    , AllLedgers
    , LedgerDetails
    , OffersForAccount
    , AllOperations
    , OperationsForAccount
    , OperationsForLedger
    , OperationsForTransaction
    , OperationDetails
    , OrderbookDetails
    , FindPaymentPaths
    , AllPayments
    , PaymentsForAccount
    , PaymentsForLedger
    , PaymentsForTransaction
    , TradeAggregations
    , Trades
    , AllTransactions
    , PostTransaction
    , TransactionsForAccount
    , TransactionsForLedger
    , TransactionDetails
    ]


endpointParser : Endpoint -> Parser (Route -> a) a
endpointParser endpoint =
    Url.map (Endpoints endpoint) (Url.s "endpoints" </> Url.s (Debug.log "endpoint" <| String.toHyphen (toString endpoint)))


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
        Url.parseHash routeParser location


routeParser : Parser (Route -> a) a
routeParser =
    Url.oneOf <|
        [ Url.map Home (Url.s "") ] ++
        ( List.map endpointParser endpointList )


isActiveRoute : Maybe Route -> Route -> Bool
isActiveRoute mRoute route =
    mRoute == Just route