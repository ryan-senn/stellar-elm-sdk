module EndpointsTest exposing (suite)

import Test exposing (..)
import Expect

import Stellar.Endpoints.AccountDetails
import Stellar.Endpoints.AllAssets
import Stellar.Endpoints.AllEffects
import Stellar.Endpoints.AllLedgers
import Stellar.Endpoints.AllOperations
import Stellar.Endpoints.AllPayments
import Stellar.Endpoints.AllTransactions
import Stellar.Endpoints.DataForAccount
import Stellar.Endpoints.EffectsForAccount
import Stellar.Endpoints.EffectsForLedger
import Stellar.Endpoints.EffectsForOperation
import Stellar.Endpoints.EffectsForTransaction
import Stellar.Endpoints.FindPaymentPaths
import Stellar.Endpoints.LedgerDetails
import Stellar.Endpoints.OffersForAccount
import Stellar.Endpoints.OperationDetails
import Stellar.Endpoints.OperationsForAccount
import Stellar.Endpoints.OperationsForLedger
import Stellar.Endpoints.OperationsForTransaction
import Stellar.Endpoints.OrderbookDetails
import Stellar.Endpoints.PaymentsForAccount
import Stellar.Endpoints.PaymentsForLedger
import Stellar.Endpoints.PaymentsForTransaction
import Stellar.Endpoints.PostTransaction
import Stellar.Endpoints.TransactionDetails
import Stellar.Endpoints.TransactionsForAccount
import Stellar.Endpoints.TransactionsForLedger


suite : Test
suite =
    describe "import endpoints for type checking"
        [ test "dummy" <| always <| Expect.equal True True ]