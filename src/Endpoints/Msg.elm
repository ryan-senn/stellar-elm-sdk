module Endpoints.Msg exposing (Msg (..))

import Form.Input as Input

import Endpoints.AccountDetails.Msg as AccountDetails
import Endpoints.AllAssets.Msg as AllAssets
import Endpoints.DataForAccount.Msg as DataForAccount
import Endpoints.AllEffects.Msg as AllEffects
import Endpoints.AllLedgers.Msg as AllLedgers
import Endpoints.LedgerDetails.Msg as LedgerDetails
import Endpoints.OffersForAccount.Msg as OffersForAccount
import Endpoints.AllOperations.Msg as AllOperations
import Endpoints.OperationsForAccount.Msg as OperationsForAccount
import Endpoints.OperationsForLedger.Msg as OperationsForLedger
import Endpoints.OperationsForTransaction.Msg as OperationsForTransaction
import Endpoints.OperationDetails.Msg as OperationDetails
import Endpoints.OrderbookDetails.Msg as OrderbookDetails


type Msg
    = UpdateEndpoint Input.Msg
    | AccountDetailsMsg AccountDetails.Msg
    | AllAssetsMsg AllAssets.Msg
    | DataForAccountMsg DataForAccount.Msg
    | AllEffectsMsg AllEffects.Msg
    | AllLedgersMsg AllLedgers.Msg
    | LedgerDetailsMsg LedgerDetails.Msg
    | OffersForAccountMsg OffersForAccount.Msg
    | AllOperationsMsg AllOperations.Msg
    | OperationsForAccountMsg OperationsForAccount.Msg
    | OperationsForLedgerMsg OperationsForLedger.Msg
    | OperationsForTransactionMsg OperationsForTransaction.Msg
    | OperationDetailsMsg OperationDetails.Msg
    | OrderbookDetailsMsg OrderbookDetails.Msg