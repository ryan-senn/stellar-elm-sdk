module Endpoints.Model exposing (Model, initialModel)

import Form.Input as Input

import Endpoints.AccountDetails.Model as AccountDetails
import Endpoints.AllAssets.Model as AllAssets
import Endpoints.DataForAccount.Model as DataForAccount
import Endpoints.AllLedgers.Model as AllLedgers
import Endpoints.LedgerDetails.Model as LedgerDetails
import Endpoints.OffersForAccount.Model as OffersForAccount
import Endpoints.AllOperations.Model as AllOperations
import Endpoints.OperationsForAccount.Model as OperationsForAccount
import Endpoints.OperationsForLedger.Model as OperationsForLedger
import Endpoints.OperationsForTransaction.Model as OperationsForTransaction


type alias Model =
    { endpoint : Input.Model
    , accountDetails : AccountDetails.Model
    , allAssets : AllAssets.Model
    , dataForAccount : DataForAccount.Model
    , allLedgers : AllLedgers.Model
    , ledgerDetails : LedgerDetails.Model
    , offersForAccount : OffersForAccount.Model
    , allOperations : AllOperations.Model
    , operationsForAccount : OperationsForAccount.Model
    , operationsForLedger : OperationsForLedger.Model
    , operationsForTransaction : OperationsForTransaction.Model
    }


initialModel : Model
initialModel =
    { endpoint = Input.init |> Input.setInitialValue "https://horizon-testnet.stellar.org"
    , accountDetails = AccountDetails.initialModel
    , allAssets = AllAssets.initialModel
    , dataForAccount = DataForAccount.initialModel
    , allLedgers = AllLedgers.initialModel
    , ledgerDetails = LedgerDetails.initialModel
    , offersForAccount = OffersForAccount.initialModel
    , allOperations = AllOperations.initialModel
    , operationsForAccount = OperationsForAccount.initialModel
    , operationsForLedger = OperationsForLedger.initialModel
    , operationsForTransaction = OperationsForTransaction.initialModel
    }