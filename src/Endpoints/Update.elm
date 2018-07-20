module Endpoints.Update exposing (update)

import Form.Input as Input

import Msg exposing (Msg)

import Endpoints.Msg as Endpoints
import Endpoints.Model as Endpoints

import Endpoints.AccountDetails.Update as AccountDetails
import Endpoints.AllAssets.Update as AllAssets
import Endpoints.DataForAccount.Update as DataForAccount
import Endpoints.AllEffects.Update as AllEffects
import Endpoints.AllLedgers.Update as AllLedgers
import Endpoints.LedgerDetails.Update as LedgerDetails
import Endpoints.OffersForAccount.Update as OffersForAccount
import Endpoints.AllOperations.Update as AllOperations
import Endpoints.OperationsForAccount.Update as OperationsForAccount
import Endpoints.OperationsForLedger.Update as OperationsForLedger
import Endpoints.OperationsForTransaction.Update as OperationsForTransaction
import Endpoints.OperationDetails.Update as OperationDetails
import Endpoints.OrderbookDetails.Update as OrderbookDetails


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

        Endpoints.AllEffectsMsg msg ->
            let
                (allEffectsModel, cmd) =
                    AllEffects.update msg model.allEffects

            in
                { model | allEffects = allEffectsModel } ! [ cmd ]

        Endpoints.DataForAccountMsg msg ->
            let
                (dataForAccountModel, cmd) =
                    DataForAccount.update msg model.dataForAccount

            in
                { model | dataForAccount = dataForAccountModel } ! [ cmd ]

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