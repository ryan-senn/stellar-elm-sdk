module Endpoints.View exposing (view)

import Html.Styled exposing (..)

import Endpoints exposing (Endpoint)

import Msg exposing (Msg (EndpointMsg))

import Endpoints.Model as Endpoints

import Endpoints.AccountDetails.View as AccountDetails
import Endpoints.AllAssets.View as AllAssets
import Endpoints.DataForAccount.View as DataForAccount
import Endpoints.AllEffects.View as AllEffects
import Endpoints.EffectsForAccount.View as EffectsForAccount
import Endpoints.EffectsForLedger.View as EffectsForLedger
import Endpoints.EffectsForOperation.View as EffectsForOperation
import Endpoints.EffectsForTransaction.View as EffectsForTransaction
import Endpoints.AllLedgers.View as AllLedgers
import Endpoints.LedgerDetails.View as LedgerDetails
import Endpoints.OffersForAccount.View as OffersForAccount
import Endpoints.AllOperations.View as AllOperations
import Endpoints.OperationsForAccount.View as OperationsForAccount
import Endpoints.OperationsForLedger.View as OperationsForLedger
import Endpoints.OperationsForTransaction.View as OperationsForTransaction
import Endpoints.OperationDetails.View as OperationDetails
import Endpoints.OrderbookDetails.View as OrderbookDetails
import Endpoints.AllPayments.View as AllPayments
import Endpoints.PaymentsForAccount.View as PaymentsForAccount
import Endpoints.PaymentsForLedger.View as PaymentsForLedger
import Endpoints.PaymentsForTransaction.View as PaymentsForTransaction
import Endpoints.AllTransactions.View as AllTransactions
import Endpoints.PostTransaction.View as PostTransaction
import Endpoints.TransactionsForAccount.View as TransactionsForAccount
import Endpoints.TransactionsForLedger.View as TransactionsForLedger
import Endpoints.TransactionDetails.View as TransactionDetails


view : Endpoints.Model -> Endpoint -> Html Msg
view endpoints endpoint =

    case endpoint of

        Endpoints.AccountDetails ->
            AccountDetails.view endpoints.endpoint endpoints.accountDetails

        Endpoints.AllAssets ->
            AllAssets.view endpoints.endpoint endpoints.allAssets

        Endpoints.DataForAccount ->
            DataForAccount.view endpoints.endpoint endpoints.dataForAccount

        Endpoints.AllEffects ->
            AllEffects.view endpoints.endpoint endpoints.allEffects

        Endpoints.EffectsForAccount ->
            EffectsForAccount.view endpoints.endpoint endpoints.effectsForAccount

        Endpoints.EffectsForLedger ->
            EffectsForLedger.view endpoints.endpoint endpoints.effectsForLedger

        Endpoints.EffectsForOperation ->
            EffectsForOperation.view endpoints.endpoint endpoints.effectsForOperation

        Endpoints.EffectsForTransaction ->
            EffectsForTransaction.view endpoints.endpoint endpoints.effectsForTransaction

        Endpoints.AllLedgers ->
            AllLedgers.view endpoints.endpoint endpoints.allLedgers

        Endpoints.LedgerDetails ->
            LedgerDetails.view endpoints.endpoint endpoints.ledgerDetails

        Endpoints.OffersForAccount ->
            OffersForAccount.view endpoints.endpoint endpoints.offersForAccount

        Endpoints.AllOperations ->
            AllOperations.view endpoints.endpoint endpoints.allOperations

        Endpoints.OperationsForAccount ->
            OperationsForAccount.view endpoints.endpoint endpoints.operationsForAccount

        Endpoints.OperationsForLedger ->
            OperationsForLedger.view endpoints.endpoint endpoints.operationsForLedger

        Endpoints.OperationsForTransaction ->
            OperationsForTransaction.view endpoints.endpoint endpoints.operationsForTransaction

        Endpoints.OperationDetails ->
            OperationDetails.view endpoints.endpoint endpoints.operationDetails

        Endpoints.OrderbookDetails ->
            OrderbookDetails.view endpoints.endpoint endpoints.orderbookDetails

        Endpoints.FindPaymentPaths ->
            findPaymentPaths endpoints

        Endpoints.AllPayments ->
            AllPayments.view endpoints.endpoint endpoints.allPayments

        Endpoints.PaymentsForAccount ->
            PaymentsForAccount.view endpoints.endpoint endpoints.paymentsForAccount

        Endpoints.PaymentsForLedger ->
            PaymentsForLedger.view endpoints.endpoint endpoints.paymentsForLedger

        Endpoints.PaymentsForTransaction ->
            PaymentsForTransaction.view endpoints.endpoint endpoints.paymentsForTransaction

        Endpoints.TradeAggregations ->
            tradeAggregations endpoints

        Endpoints.Trades ->
            trades endpoints

        Endpoints.AllTransactions ->
            AllTransactions.view endpoints.endpoint endpoints.allTransactions

        Endpoints.PostTransaction ->
            PostTransaction.view endpoints.endpoint endpoints.postTransaction

        Endpoints.TransactionsForAccount ->
            TransactionsForAccount.view endpoints.endpoint endpoints.transactionsForAccount

        Endpoints.TransactionsForLedger ->
            TransactionsForLedger.view endpoints.endpoint endpoints.transactionsForLedger

        Endpoints.TransactionDetails ->
            TransactionDetails.view endpoints.endpoint endpoints.transactionDetails


findPaymentPaths : Endpoints.Model -> Html Msg
findPaymentPaths endpoints =
    div
        []
        [ text "todo" ]


tradeAggregations : Endpoints.Model -> Html Msg
tradeAggregations endpoints =
    div
        []
        [ text "todo" ]


trades : Endpoints.Model -> Html Msg
trades endpoints =
    div
        []
        [ text "todo" ]