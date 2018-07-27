module Endpoints.Update exposing (update)

import Form.Input as Input

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.Model as Endpoints

import Endpoints.AccountDetails.Update as AccountDetails
import Endpoints.AllAssets.Update as AllAssets
import Endpoints.DataForAccount.Update as DataForAccount
import Endpoints.AllEffects.Update as AllEffects
import Endpoints.EffectsForAccount.Update as EffectsForAccount
import Endpoints.EffectsForLedger.Update as EffectsForLedger
import Endpoints.EffectsForOperation.Update as EffectsForOperation
import Endpoints.EffectsForTransaction.Update as EffectsForTransaction
import Endpoints.AllLedgers.Update as AllLedgers
import Endpoints.LedgerDetails.Update as LedgerDetails
import Endpoints.OffersForAccount.Update as OffersForAccount
import Endpoints.AllOperations.Update as AllOperations
import Endpoints.OperationsForAccount.Update as OperationsForAccount
import Endpoints.OperationsForLedger.Update as OperationsForLedger
import Endpoints.OperationsForTransaction.Update as OperationsForTransaction
import Endpoints.OperationDetails.Update as OperationDetails
import Endpoints.OrderbookDetails.Update as OrderbookDetails
import Endpoints.AllPayments.Update as AllPayments
import Endpoints.PaymentsForAccount.Update as PaymentsForAccount
import Endpoints.PaymentsForLedger.Update as PaymentsForLedger
import Endpoints.PaymentsForTransaction.Update as PaymentsForTransaction
import Endpoints.AllTransactions.Update as AllTransactions
import Endpoints.PostTransaction.Update as PostTransaction
import Endpoints.TransactionsForAccount.Update as TransactionsForAccount
import Endpoints.TransactionsForLedger.Update as TransactionsForLedger
import Endpoints.TransactionDetails.Update as TransactionDetails


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

        Endpoints.AllEffectsMsg msg ->
            let
                (allEffectsModel, cmd) =
                    AllEffects.update msg model.allEffects

            in
                { model | allEffects = allEffectsModel } ! [ cmd ]

        Endpoints.EffectsForAccountMsg msg ->
            let
                (effectsForAccountModel, cmd) =
                    EffectsForAccount.update msg model.effectsForAccount

            in
                { model | effectsForAccount = effectsForAccountModel } ! [ cmd ]

        Endpoints.EffectsForLedgerMsg msg ->
            let
                (effectsForLedgerModel, cmd) =
                    EffectsForLedger.update msg model.effectsForLedger

            in
                { model | effectsForLedger = effectsForLedgerModel } ! [ cmd ]

        Endpoints.EffectsForOperationMsg msg ->
            let
                (effectsForOperationModel, cmd) =
                    EffectsForOperation.update msg model.effectsForOperation

            in
                { model | effectsForOperation = effectsForOperationModel } ! [ cmd ]

        Endpoints.EffectsForTransactionMsg msg ->
            let
                (effectsForTransactionModel, cmd) =
                    EffectsForTransaction.update msg model.effectsForTransaction

            in
                { model | effectsForTransaction = effectsForTransactionModel } ! [ cmd ]

        Endpoints.AllLedgersMsg msg ->
            let
                (allLedgersModel, cmd) =
                    AllLedgers.update msg model.allLedgers

            in
                { model | allLedgers = allLedgersModel } ! [ cmd ]

        Endpoints.LedgerDetailsMsg msg ->
            let
                (ledgerDetailsModel, cmd) =
                    LedgerDetails.update msg model.ledgerDetails

            in
                { model | ledgerDetails = ledgerDetailsModel } ! [ cmd ]

        Endpoints.OffersForAccountMsg msg ->
            let
                (offersForAccountModel, cmd) =
                    OffersForAccount.update msg model.offersForAccount

            in
                { model | offersForAccount = offersForAccountModel } ! [ cmd ]

        Endpoints.AllOperationsMsg msg ->
            let
                (allOperationsModel, cmd) =
                    AllOperations.update msg model.allOperations

            in
                { model | allOperations = allOperationsModel } ! [ cmd ]

        Endpoints.OperationsForAccountMsg msg ->
            let
                (operationsForAccountModel, cmd) =
                    OperationsForAccount.update msg model.operationsForAccount

            in
                { model | operationsForAccount = operationsForAccountModel } ! [ cmd ]

        Endpoints.OperationsForLedgerMsg msg ->
            let
                (operationsForLedgerModel, cmd) =
                    OperationsForLedger.update msg model.operationsForLedger

            in
                { model | operationsForLedger = operationsForLedgerModel } ! [ cmd ]

        Endpoints.OperationsForTransactionMsg msg ->
            let
                (operationsForTransactionModel, cmd) =
                    OperationsForTransaction.update msg model.operationsForTransaction

            in
                { model | operationsForTransaction = operationsForTransactionModel } ! [ cmd ]

        Endpoints.OperationDetailsMsg msg ->
            let
                (operationDetailsModel, cmd) =
                    OperationDetails.update msg model.operationDetails

            in
                { model | operationDetails = operationDetailsModel } ! [ cmd ]

        Endpoints.OrderbookDetailsMsg msg ->
            let
                (orderbookDetailsModel, cmd) =
                    OrderbookDetails.update msg model.orderbookDetails

            in
                { model | orderbookDetails = orderbookDetailsModel } ! [ cmd ]

        Endpoints.AllPaymentsMsg msg ->
            let
                (allPaymentsModel, cmd) =
                    AllPayments.update msg model.allPayments

            in
                { model | allPayments = allPaymentsModel } ! [ cmd ]

        Endpoints.PaymentsForAccountMsg msg ->
            let
                (paymentsForAccountModel, cmd) =
                    PaymentsForAccount.update msg model.paymentsForAccount

            in
                { model | paymentsForAccount = paymentsForAccountModel } ! [ cmd ]

        Endpoints.PaymentsForLedgerMsg msg ->
            let
                (paymentsForLedgerModel, cmd) =
                    PaymentsForLedger.update msg model.paymentsForLedger

            in
                { model | paymentsForLedger = paymentsForLedgerModel } ! [ cmd ]

        Endpoints.PaymentsForTransactionMsg msg ->
            let
                (paymentsForTransactionModel, cmd) =
                    PaymentsForTransaction.update msg model.paymentsForTransaction

            in
                { model | paymentsForTransaction = paymentsForTransactionModel } ! [ cmd ]

        Endpoints.AllTransactionsMsg msg ->
            let
                (allTransactionsModel, cmd) =
                    AllTransactions.update msg model.allTransactions

            in
                { model | allTransactions = allTransactionsModel } ! [ cmd ]

        Endpoints.PostTransactionMsg msg ->
            let
                (postTransactionModel, cmd) =
                    PostTransaction.update msg model.postTransaction

            in
                { model | postTransaction = postTransactionModel } ! [ cmd ]

        Endpoints.TransactionsForAccountMsg msg ->
            let
                (transactionsForAccountModel, cmd) =
                    TransactionsForAccount.update msg model.transactionsForAccount

            in
                { model | transactionsForAccount = transactionsForAccountModel } ! [ cmd ]

        Endpoints.TransactionsForLedgerMsg msg ->
            let
                (transactionsForLedgerModel, cmd) =
                    TransactionsForLedger.update msg model.transactionsForLedger

            in
                { model | transactionsForLedger = transactionsForLedgerModel } ! [ cmd ]

        Endpoints.TransactionDetailsMsg msg ->
            let
                (transactionDetailsModel, cmd) =
                    TransactionDetails.update msg model.transactionDetails

            in
                { model | transactionDetails = transactionDetailsModel } ! [ cmd ]