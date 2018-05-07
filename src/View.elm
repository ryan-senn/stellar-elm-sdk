module View exposing (view)

import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)
import Styles as S

import Routes exposing (Route)
import Endpoints exposing (Endpoint)

import Msg exposing (Msg (EndpointMsg))
import Model exposing (Model)

import Helpers.String as String

import Endpoints.Model as Endpoints

import Endpoints.AccountDetails.View as AccountDetails


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
            [ text <| String.toWords <| toString endpoint ]
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
            AccountDetails.view endpoints.accountDetails

        Routes.Endpoints Endpoints.AllAssets ->
            allAssets endpoints

        Routes.Endpoints Endpoints.DataForAccount ->
            dataForAccount endpoints

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
            allLedgers endpoints

        Routes.Endpoints Endpoints.LedgerDetails ->
            ledgerDetails endpoints

        Routes.Endpoints Endpoints.OffersForAccount ->
            offersForAccount endpoints

        Routes.Endpoints Endpoints.AllOperations ->
            allOperations endpoints

        Routes.Endpoints Endpoints.OperationsForAccount ->
            operationsForAccount endpoints

        Routes.Endpoints Endpoints.OperationsForLedger ->
            operationsForLedger endpoints

        Routes.Endpoints Endpoints.OperationsForTransaction ->
            operationsForTransaction endpoints

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


allAssets : Endpoints.Model -> Html Msg
allAssets endpoints =
    div
        []
        [ text "todo" ]


dataForAccount : Endpoints.Model -> Html Msg
dataForAccount endpoints =
    div
        []
        [ text "todo" ]


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


allLedgers : Endpoints.Model -> Html Msg
allLedgers endpoints =
    div
        []
        [ text "todo" ]


ledgerDetails : Endpoints.Model -> Html Msg
ledgerDetails endpoints =
    div
        []
        [ text "todo" ]


offersForAccount : Endpoints.Model -> Html Msg
offersForAccount endpoints =
    div
        []
        [ text "todo" ]


allOperations : Endpoints.Model -> Html Msg
allOperations endpoints =
    div
        []
        [ text "todo" ]


operationsForAccount : Endpoints.Model -> Html Msg
operationsForAccount endpoints =
    div
        []
        [ text "todo" ]


operationsForLedger : Endpoints.Model -> Html Msg
operationsForLedger endpoints =
    div
        []
        [ text "todo" ]


operationsForTransaction : Endpoints.Model -> Html Msg
operationsForTransaction endpoints =
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