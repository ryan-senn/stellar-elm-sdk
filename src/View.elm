module View exposing (view)

import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)
import Styles as S

import String.Extra as String

import Routes exposing (Route)
import Endpoints exposing (Endpoint)

import Msg exposing (Msg (EndpointMsg))
import Model exposing (Model)

import Endpoints.Model as Endpoints

import Endpoints.AccountDetails.View as AccountDetails
import Endpoints.AllAssets.View as AllAssets
import Endpoints.DataForAccount.View as DataForAccount
import Endpoints.AllLedgers.View as AllLedgers
import Endpoints.LedgerDetails.View as LedgerDetails
import Endpoints.OffersForAccount.View as OffersForAccount
import Endpoints.AllOperations.View as AllOperations
import Endpoints.OperationsForAccount.View as OperationsForAccount
import Endpoints.OperationsForLedger.View as OperationsForLedger
import Endpoints.OperationsForTransaction.View as OperationsForTransaction


view : Model -> Html Msg
view model =
    div
        [ S.layout ]
        [ header
        , body model
        ]


header : Html Msg
header =
    div
        [ S.header ]
        [ h1
            [ S.title
            ]
            [ span
                [ S.stellarTitle ]
                [ text "stellar" ]
            , span
                [ S.elmTitle ]
                [ text "elm api" ]
            ]
        ]


body : Model -> Html Msg
body model =
    div
        [ S.body ]
        [ sidebar model.route
        , content model
        ]


sidebar : Maybe Route -> Html Msg
sidebar mRoute =
    div
        [ S.sidebar ]
        [ h4
            [ S.sidebarTitle ]
            [ text "Endpoints" ]
        , ul
            [ S.sidebarList
            ]
            ( List.map (menuItem mRoute) Endpoints.asList )
        ]


menuItem : Maybe Route -> Endpoint -> Html Msg
menuItem mRoute endpoint =
    li
        [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints endpoint) ]
        [ a
            [ S.sidebarItemLink, Routes.href <| Routes.Endpoints endpoint ]
            [ toString endpoint |> String.humanize |> String.toTitleCase |> text  ]
        ]


content : Model -> Html Msg
content model =

    case model.route of

        Nothing ->
            div
                [ S.content ]
                [ text "Page not found D:" ]

        Just route ->
            div
                [ S.content ]
                [ page model.endpoints route ]


page : Endpoints.Model -> Route -> Html Msg
page endpoints route =

    case route of

        Routes.Home ->
            div
                []
                [ text "Home" ]

        Routes.Endpoints Endpoints.AccountDetails ->
            AccountDetails.view endpoints.endpoint endpoints.accountDetails

        Routes.Endpoints Endpoints.AllAssets ->
            AllAssets.view endpoints.endpoint endpoints.allAssets

        Routes.Endpoints Endpoints.DataForAccount ->
            DataForAccount.view endpoints.endpoint endpoints.dataForAccount

        Routes.Endpoints Endpoints.AllEffects ->
            allEffects endpoints

        Routes.Endpoints Endpoints.EffectsForAccount ->
            effectsForAccount endpoints

        Routes.Endpoints Endpoints.EffectsForLedger ->
            effectsForLedger endpoints

        Routes.Endpoints Endpoints.EffectsForOperation ->
            effectsForOperation endpoints

        Routes.Endpoints Endpoints.EffectsForTransaction ->
            effectsForTransaction endpoints

        Routes.Endpoints Endpoints.AllLedgers ->
            AllLedgers.view endpoints.endpoint endpoints.allLedgers

        Routes.Endpoints Endpoints.LedgerDetails ->
            LedgerDetails.view endpoints.endpoint endpoints.ledgerDetails

        Routes.Endpoints Endpoints.OffersForAccount ->
            OffersForAccount.view endpoints.endpoint endpoints.offersForAccount

        Routes.Endpoints Endpoints.AllOperations ->
            AllOperations.view endpoints.endpoint endpoints.allOperations

        Routes.Endpoints Endpoints.OperationsForAccount ->
            OperationsForAccount.view endpoints.endpoint endpoints.operationsForAccount

        Routes.Endpoints Endpoints.OperationsForLedger ->
            OperationsForLedger.view endpoints.endpoint endpoints.operationsForLedger

        Routes.Endpoints Endpoints.OperationsForTransaction ->
            OperationsForTransaction.view endpoints.endpoint endpoints.operationsForTransaction

        Routes.Endpoints Endpoints.OperationDetails ->
            operationDetails endpoints

        Routes.Endpoints Endpoints.OrderbookDetails ->
            orderbookDetails endpoints

        Routes.Endpoints Endpoints.FindPaymentPaths ->
            findPaymentPaths endpoints

        Routes.Endpoints Endpoints.AllPayments ->
            allPayments endpoints

        Routes.Endpoints Endpoints.PaymentsForAccount ->
            paymentsForAccount endpoints

        Routes.Endpoints Endpoints.PaymentsForLedger ->
            paymentsForLedger endpoints

        Routes.Endpoints Endpoints.PaymentsForTransaction ->
            paymentsForTransaction endpoints

        Routes.Endpoints Endpoints.TradeAggregations ->
            tradeAggregations endpoints

        Routes.Endpoints Endpoints.Trades ->
            trades endpoints

        Routes.Endpoints Endpoints.AllTransactions ->
            allTransactions endpoints

        Routes.Endpoints Endpoints.PostTransaction ->
            postTransaction endpoints

        Routes.Endpoints Endpoints.TransactionsForAccount ->
            transactionsForAccount endpoints

        Routes.Endpoints Endpoints.TransactionsForLedger ->
            transactionsForLedger endpoints

        Routes.Endpoints Endpoints.TransactionDetails ->
            transactionDetails endpoints


allEffects : Endpoints.Model -> Html Msg
allEffects endpoints =
    div
        []
        [ text "todo" ]


effectsForAccount : Endpoints.Model -> Html Msg
effectsForAccount endpoints =
    div
        []
        [ text "todo" ]


effectsForLedger : Endpoints.Model -> Html Msg
effectsForLedger endpoints =
    div
        []
        [ text "todo" ]


effectsForOperation : Endpoints.Model -> Html Msg
effectsForOperation endpoints =
    div
        []
        [ text "todo" ]


effectsForTransaction : Endpoints.Model -> Html Msg
effectsForTransaction endpoints =
    div
        []
        [ text "todo" ]


operationDetails : Endpoints.Model -> Html Msg
operationDetails endpoints =
    div
        []
        [ text "todo" ]


orderbookDetails : Endpoints.Model -> Html Msg
orderbookDetails endpoints =
    div
        []
        [ text "todo" ]


findPaymentPaths : Endpoints.Model -> Html Msg
findPaymentPaths endpoints =
    div
        []
        [ text "todo" ]


allPayments : Endpoints.Model -> Html Msg
allPayments endpoints =
    div
        []
        [ text "todo" ]


paymentsForAccount : Endpoints.Model -> Html Msg
paymentsForAccount endpoints =
    div
        []
        [ text "todo" ]


paymentsForLedger : Endpoints.Model -> Html Msg
paymentsForLedger endpoints =
    div
        []
        [ text "todo" ]


paymentsForTransaction : Endpoints.Model -> Html Msg
paymentsForTransaction endpoints =
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


allTransactions : Endpoints.Model -> Html Msg
allTransactions endpoints =
    div
        []
        [ text "todo" ]


postTransaction : Endpoints.Model -> Html Msg
postTransaction endpoints =
    div
        []
        [ text "todo" ]


transactionsForAccount : Endpoints.Model -> Html Msg
transactionsForAccount endpoints =
    div
        []
        [ text "todo" ]


transactionsForLedger : Endpoints.Model -> Html Msg
transactionsForLedger endpoints =
    div
        []
        [ text "todo" ]


transactionDetails : Endpoints.Model -> Html Msg
transactionDetails endpoints =
    div
        []
        [ text "todo" ]