module Endpoints.Model exposing (Model, initialModel)

import Form.Input as Input

import Endpoints.AccountDetails.Model as AccountDetails
import Endpoints.AllAssets.Model as AllAssets
import Endpoints.DataForAccount.Model as DataForAccount
import Endpoints.AllEffects.Model as AllEffects
import Endpoints.EffectsForAccount.Model as EffectsForAccount
import Endpoints.EffectsForLedger.Model as EffectsForLedger
import Endpoints.EffectsForOperation.Model as EffectsForOperation
import Endpoints.EffectsForTransaction.Model as EffectsForTransaction
import Endpoints.AllLedgers.Model as AllLedgers
import Endpoints.LedgerDetails.Model as LedgerDetails
import Endpoints.OffersForAccount.Model as OffersForAccount
import Endpoints.AllOperations.Model as AllOperations
import Endpoints.OperationsForAccount.Model as OperationsForAccount
import Endpoints.OperationsForLedger.Model as OperationsForLedger
import Endpoints.OperationsForTransaction.Model as OperationsForTransaction
import Endpoints.OperationDetails.Model as OperationDetails
import Endpoints.OrderbookDetails.Model as OrderbookDetails
import Endpoints.AllPayments.Model as AllPayments
import Endpoints.PaymentsForAccount.Model as PaymentsForAccount
import Endpoints.PaymentsForLedger.Model as PaymentsForLedger
import Endpoints.PaymentsForTransaction.Model as PaymentsForTransaction
import Endpoints.AllTransactions.Model as AllTransactions
import Endpoints.TransactionsForAccount.Model as TransactionsForAccount
import Endpoints.TransactionsForLedger.Model as TransactionsForLedger


type alias Model =
    { endpoint : Input.Model
    , accountDetails : AccountDetails.Model
    , allAssets : AllAssets.Model
    , allEffects : AllEffects.Model
    , effectsForAccount : EffectsForAccount.Model
    , effectsForLedger : EffectsForLedger.Model
    , effectsForOperation : EffectsForOperation.Model
    , effectsForTransaction : EffectsForTransaction.Model
    , dataForAccount : DataForAccount.Model
    , allLedgers : AllLedgers.Model
    , ledgerDetails : LedgerDetails.Model
    , offersForAccount : OffersForAccount.Model
    , allOperations : AllOperations.Model
    , operationsForAccount : OperationsForAccount.Model
    , operationsForLedger : OperationsForLedger.Model
    , operationsForTransaction : OperationsForTransaction.Model
    , operationDetails : OperationDetails.Model
    , orderbookDetails : OrderbookDetails.Model
    , allPayments : AllPayments.Model
    , paymentsForAccount : PaymentsForAccount.Model
    , paymentsForLedger : PaymentsForLedger.Model
    , paymentsForTransaction : PaymentsForTransaction.Model
    , allTransactions : AllTransactions.Model
    , transactionsForAccount : TransactionsForAccount.Model
    , transactionsForLedger : TransactionsForLedger.Model
    }


initialModel : Model
initialModel =
    { endpoint = Input.init |> Input.setInitialValue "https://horizon-testnet.stellar.org"
    , accountDetails = AccountDetails.initialModel
    , allAssets = AllAssets.initialModel
    , allEffects = AllEffects.initialModel
    , effectsForAccount = EffectsForAccount.initialModel
    , effectsForLedger = EffectsForLedger.initialModel
    , effectsForOperation = EffectsForOperation.initialModel
    , effectsForTransaction = EffectsForTransaction.initialModel
    , dataForAccount = DataForAccount.initialModel
    , allLedgers = AllLedgers.initialModel
    , ledgerDetails = LedgerDetails.initialModel
    , offersForAccount = OffersForAccount.initialModel
    , allOperations = AllOperations.initialModel
    , operationsForAccount = OperationsForAccount.initialModel
    , operationsForLedger = OperationsForLedger.initialModel
    , operationsForTransaction = OperationsForTransaction.initialModel
    , operationDetails = OperationDetails.initialModel
    , orderbookDetails = OrderbookDetails.initialModel
    , allPayments = AllPayments.initialModel
    , paymentsForAccount = PaymentsForAccount.initialModel
    , paymentsForLedger = PaymentsForLedger.initialModel
    , paymentsForTransaction = PaymentsForTransaction.initialModel
    , allTransactions = AllTransactions.initialModel
    , transactionsForAccount = TransactionsForAccount.initialModel
    , transactionsForLedger = TransactionsForLedger.initialModel
    }