module Endpoints.Msg exposing (Msg (..))

import Form.Input as Input

import Endpoints.AccountDetails.Msg as AccountDetails
import Endpoints.AllAssets.Msg as AllAssets
import Endpoints.DataForAccount.Msg as DataForAccount
import Endpoints.AllEffects.Msg as AllEffects
import Endpoints.EffectsForAccount.Msg as EffectsForAccount
import Endpoints.EffectsForLedger.Msg as EffectsForLedger
import Endpoints.EffectsForOperation.Msg as EffectsForOperation
import Endpoints.EffectsForTransaction.Msg as EffectsForTransaction
import Endpoints.AllLedgers.Msg as AllLedgers
import Endpoints.LedgerDetails.Msg as LedgerDetails
import Endpoints.OffersForAccount.Msg as OffersForAccount
import Endpoints.AllOperations.Msg as AllOperations
import Endpoints.OperationsForAccount.Msg as OperationsForAccount
import Endpoints.OperationsForLedger.Msg as OperationsForLedger
import Endpoints.OperationsForTransaction.Msg as OperationsForTransaction
import Endpoints.OperationDetails.Msg as OperationDetails
import Endpoints.OrderbookDetails.Msg as OrderbookDetails
import Endpoints.FindPaymentPaths.Msg as FindPaymentPaths
import Endpoints.AllPayments.Msg as AllPayments
import Endpoints.PaymentsForAccount.Msg as PaymentsForAccount
import Endpoints.PaymentsForLedger.Msg as PaymentsForLedger
import Endpoints.PaymentsForTransaction.Msg as PaymentsForTransaction
import Endpoints.AllTransactions.Msg as AllTransactions
import Endpoints.PostTransaction.Msg as PostTransaction
import Endpoints.TransactionsForAccount.Msg as TransactionsForAccount
import Endpoints.TransactionsForLedger.Msg as TransactionsForLedger
import Endpoints.TransactionDetails.Msg as TransactionDetails


type Msg
    = UpdateEndpoint Input.Msg
    | AccountDetailsMsg AccountDetails.Msg
    | AllAssetsMsg AllAssets.Msg
    | DataForAccountMsg DataForAccount.Msg
    | AllEffectsMsg AllEffects.Msg
    | EffectsForAccountMsg EffectsForAccount.Msg
    | EffectsForLedgerMsg EffectsForLedger.Msg
    | EffectsForOperationMsg EffectsForOperation.Msg
    | EffectsForTransactionMsg EffectsForTransaction.Msg
    | AllLedgersMsg AllLedgers.Msg
    | LedgerDetailsMsg LedgerDetails.Msg
    | OffersForAccountMsg OffersForAccount.Msg
    | AllOperationsMsg AllOperations.Msg
    | OperationsForAccountMsg OperationsForAccount.Msg
    | OperationsForLedgerMsg OperationsForLedger.Msg
    | OperationsForTransactionMsg OperationsForTransaction.Msg
    | OperationDetailsMsg OperationDetails.Msg
    | OrderbookDetailsMsg OrderbookDetails.Msg
    | FindPaymentPathsMsg FindPaymentPaths.Msg
    | AllPaymentsMsg AllPayments.Msg
    | PaymentsForAccountMsg PaymentsForAccount.Msg
    | PaymentsForLedgerMsg PaymentsForLedger.Msg
    | PaymentsForTransactionMsg PaymentsForTransaction.Msg
    | AllTransactionsMsg AllTransactions.Msg
    | PostTransactionMsg PostTransaction.Msg
    | TransactionsForAccountMsg TransactionsForAccount.Msg
    | TransactionsForLedgerMsg TransactionsForLedger.Msg
    | TransactionDetailsMsg TransactionDetails.Msg