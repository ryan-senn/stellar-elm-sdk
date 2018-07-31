module Endpoints exposing (Endpoint (..), asList)


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
    | AllTransactions
    | PostTransaction
    | TransactionsForAccount
    | TransactionsForLedger
    | TransactionDetails


asList : List Endpoint
asList =
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
    , AllTransactions
    , PostTransaction
    , TransactionsForAccount
    , TransactionsForLedger
    , TransactionDetails
    ]