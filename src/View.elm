module View exposing (view)

import Http

import Stellar.Endpoint as Endpoint
import Stellar.PublicKey as PublicKey

import Html
import Html.Styled exposing (..)
import Html.Styled.Events exposing (..)
import Html.Styled.Attributes exposing (..)
import Styles as S

import SyntaxHighlight
import RecordFormatter

import Msg exposing (Msg (AccountRequest, AllAssetsRequest))
import Model exposing (Model)

import Routes exposing (Route)


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
            [ li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.AccountDetails) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.AccountDetails ]
                    [ text "Account Details" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.AllAssets) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.AllAssets ]
                    [ text "All Assets" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.DataForAccount) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.DataForAccount ]
                    [ text "Data For Account" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.AllEffects) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.AllEffects ]
                    [ text "All Effects" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.EffectsForAccount) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.EffectsForAccount ]
                    [ text "Effects For Account" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.EffectsForLedger) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.EffectsForLedger ]
                    [ text "Effects For Ledger" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.EffectsForOperation) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.EffectsForOperation ]
                    [ text "Effects For Operation" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.EffectsForTransaction) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.EffectsForTransaction ]
                    [ text "Effects For Transaction" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.AllLedgers) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.AllLedgers ]
                    [ text "All Ledgers" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.LedgerDetails) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.LedgerDetails ]
                    [ text "Ledger Details" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.OffersForAccount) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.OffersForAccount ]
                    [ text "Offers For Account" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.AllOperations) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.AllOperations ]
                    [ text "All Operations" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.OperationsForAccount) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.OperationsForAccount ]
                    [ text "Operations For Account" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.OperationsForLedger) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.OperationsForLedger ]
                    [ text "Operations For Ledger" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.OperationsForTransaction) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.OperationsForTransaction ]
                    [ text "Operations For Transaction" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.OperationDetails) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.OperationDetails ]
                    [ text "Operation Details" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.OrderbookDetails) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.OrderbookDetails ]
                    [ text "Orderbook Details" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.FindPaymentPaths) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.FindPaymentPaths ]
                    [ text "Find Payment Paths" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.AllPayments) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.AllPayments ]
                    [ text "All Payments" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.PaymentsForAccount) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.PaymentsForAccount ]
                    [ text "Payments For Account" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.PaymentsForLedger) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.PaymentsForLedger ]
                    [ text "Payments For Ledger" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.PaymentsForTransaction) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.PaymentsForTransaction ]
                    [ text "Payments For Transaction" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.TradeAggregations) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.TradeAggregations ]
                    [ text "Trade Aggregations" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.Trades) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.Trades ]
                    [ text "Trades" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.AllTransactions) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.AllTransactions ]
                    [ text "All Transactions" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.PostTransaction) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.PostTransaction ]
                    [ text "Post Transaction" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.TransactionsForAccount) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.TransactionsForAccount ]
                    [ text "Transactions For Account" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.TransactionsForLedger) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.TransactionsForLedger ]
                    [ text "Transactions For Ledger" ]
                ]
            , li
                [ S.sidebarItem <| Routes.isActiveRoute mRoute (Routes.Endpoints Routes.TransactionDetails) ]
                [ a
                    [ S.sidebarItemLink, Routes.href <| Routes.Endpoints Routes.TransactionDetails ]
                    [ text "Transaction Details" ]
                ]
            ]
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
                [ page model route ]


page : Model -> Route -> Html Msg
page model route =

    case route of

        Routes.Home ->
            div
                []
                [ text "Home" ]

        Routes.Endpoints Routes.AccountDetails ->
            accountDetails model

        Routes.Endpoints Routes.AllAssets ->
            allAssets model

        Routes.Endpoints Routes.DataForAccount ->
            dataForAccount model

        Routes.Endpoints Routes.AllEffects ->
            allEffects model

        Routes.Endpoints Routes.EffectsForAccount ->
            effectsForAccount model

        Routes.Endpoints Routes.EffectsForLedger ->
            effectsForLedger model

        Routes.Endpoints Routes.EffectsForOperation ->
            effectsForOperation model

        Routes.Endpoints Routes.EffectsForTransaction ->
            effectsForTransaction model

        Routes.Endpoints Routes.AllLedgers ->
            allLedgers model

        Routes.Endpoints Routes.LedgerDetails ->
            ledgerDetails model

        Routes.Endpoints Routes.OffersForAccount ->
            offersForAccount model

        Routes.Endpoints Routes.AllOperations ->
            allOperations model

        Routes.Endpoints Routes.OperationsForAccount ->
            operationsForAccount model

        Routes.Endpoints Routes.OperationsForLedger ->
            operationsForLedger model

        Routes.Endpoints Routes.OperationsForTransaction ->
            operationsForTransaction model

        Routes.Endpoints Routes.OperationDetails ->
            operationDetails model

        Routes.Endpoints Routes.OrderbookDetails ->
            orderbookDetails model

        Routes.Endpoints Routes.FindPaymentPaths ->
            findPaymentPaths model

        Routes.Endpoints Routes.AllPayments ->
            allPayments model

        Routes.Endpoints Routes.PaymentsForAccount ->
            paymentsForAccount model

        Routes.Endpoints Routes.PaymentsForLedger ->
            paymentsForLedger model

        Routes.Endpoints Routes.PaymentsForTransaction ->
            paymentsForTransaction model

        Routes.Endpoints Routes.TradeAggregations ->
            tradeAggregations model

        Routes.Endpoints Routes.Trades ->
            trades model

        Routes.Endpoints Routes.AllTransactions ->
            allTransactions model

        Routes.Endpoints Routes.PostTransaction ->
            postTransaction model

        Routes.Endpoints Routes.TransactionsForAccount ->
            transactionsForAccount model

        Routes.Endpoints Routes.TransactionsForLedger ->
            transactionsForLedger model

        Routes.Endpoints Routes.TransactionDetails ->
            transactionDetails model


pageTitle : String -> String -> Html Msg
pageTitle title link =
    div
        [ S.pageTitleContainer ]
        [ h2
            [ S.pageTitle ]
            [ text title ]
        , span
            [ S.officialLink ]
            [ text "Link to the offial docs: " ]
        , a
            [ S.officialLink, href link, target "_blank" ]
            [ text title ]
        ]


accountDetails : Model -> Html Msg
accountDetails model =
    div
        []
        [ pageTitle "Account Details" "https://www.stellar.org/developers/horizon/reference/endpoints/accounts-single.html"
        , div
            [ S.page ]
            [ button
                [ onClick <| AccountRequest Endpoint.dummy PublicKey.dummy ]
                [ text "Request" ]
            , h4
                []
                [ text "response" ]
            , response model.accountResponse
            ]
        ]


allAssets : Model -> Html Msg
allAssets model =
    div
        []
        [ pageTitle "All Assets" "https://www.stellar.org/developers/horizon/reference/endpoints/assets-all.html"
        , div
            [ S.page ]
            [ button
                [ onClick <| AllAssetsRequest Endpoint.dummy ]
                [ text "Request" ]
            , h4
                []
                [ text "response" ]
            , response model.allAssetsResponse
            ]
        ]


dataForAccount : Model -> Html Msg
dataForAccount model =
    div
        []
        [ text "todo" ]


allEffects : Model -> Html Msg
allEffects model =
    div
        []
        [ text "todo" ]


effectsForAccount : Model -> Html Msg
effectsForAccount model =
    div
        []
        [ text "todo" ]


effectsForLedger : Model -> Html Msg
effectsForLedger model =
    div
        []
        [ text "todo" ]


effectsForOperation : Model -> Html Msg
effectsForOperation model =
    div
        []
        [ text "todo" ]


effectsForTransaction : Model -> Html Msg
effectsForTransaction model =
    div
        []
        [ text "todo" ]


allLedgers : Model -> Html Msg
allLedgers model =
    div
        []
        [ text "todo" ]


ledgerDetails : Model -> Html Msg
ledgerDetails model =
    div
        []
        [ text "todo" ]


offersForAccount : Model -> Html Msg
offersForAccount model =
    div
        []
        [ text "todo" ]


allOperations : Model -> Html Msg
allOperations model =
    div
        []
        [ text "todo" ]


operationsForAccount : Model -> Html Msg
operationsForAccount model =
    div
        []
        [ text "todo" ]


operationsForLedger : Model -> Html Msg
operationsForLedger model =
    div
        []
        [ text "todo" ]


operationsForTransaction : Model -> Html Msg
operationsForTransaction model =
    div
        []
        [ text "todo" ]


operationDetails : Model -> Html Msg
operationDetails model =
    div
        []
        [ text "todo" ]


orderbookDetails : Model -> Html Msg
orderbookDetails model =
    div
        []
        [ text "todo" ]


findPaymentPaths : Model -> Html Msg
findPaymentPaths model =
    div
        []
        [ text "todo" ]


allPayments : Model -> Html Msg
allPayments model =
    div
        []
        [ text "todo" ]


paymentsForAccount : Model -> Html Msg
paymentsForAccount model =
    div
        []
        [ text "todo" ]


paymentsForLedger : Model -> Html Msg
paymentsForLedger model =
    div
        []
        [ text "todo" ]


paymentsForTransaction : Model -> Html Msg
paymentsForTransaction model =
    div
        []
        [ text "todo" ]


tradeAggregations : Model -> Html Msg
tradeAggregations model =
    div
        []
        [ text "todo" ]


trades : Model -> Html Msg
trades model =
    div
        []
        [ text "todo" ]


allTransactions : Model -> Html Msg
allTransactions model =
    div
        []
        [ text "todo" ]


postTransaction : Model -> Html Msg
postTransaction model =
    div
        []
        [ text "todo" ]


transactionsForAccount : Model -> Html Msg
transactionsForAccount model =
    div
        []
        [ text "todo" ]


transactionsForLedger : Model -> Html Msg
transactionsForLedger model =
    div
        []
        [ text "todo" ]


transactionDetails : Model -> Html Msg
transactionDetails model =
    div
        []
        [ text "todo" ]


response : Maybe (Result Http.Error record) -> Html Msg
response response =

    case response of

        Nothing ->
            text ""

        Just (Err error) ->
            div
                []
                [ div
                    []
                    [ text "Something went wrong D:" ]
                , div
                    []
                    [ text <| toString error ]
                ]

        Just (Ok record) ->
            div
                [ S.response ]
                [ SyntaxHighlight.useTheme SyntaxHighlight.monokai
                    |> Html.Styled.fromUnstyled
                , SyntaxHighlight.elm (RecordFormatter.toString record)
                    |> Result.map (SyntaxHighlight.toBlockHtml (Just 1) >> Html.Styled.fromUnstyled)
                    |> Result.withDefault
                        (div [] [ text "Displaying response failed" ])
                ]