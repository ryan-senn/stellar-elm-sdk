module Resources.Effects.AccountDebitedTest exposing (suite)

import Test exposing (..)
import Expect exposing (Expectation)

import Json.Decode as Decode

import Date
import Time

import Stellar.AssetType as AssetType

import Stellar.Resources.Effect as Effect exposing (Effect)
import Stellar.Resources.Internal.Effect as Effect

import Stellar.Resources.Effects.AccountDebited exposing (AccountDebited)
import Stellar.Resources.Effects.Internal.AccountDebited as AccountDebited


suite : Test
suite =
    describe "Test Resources.Effects.AccountDebitedTest"
        [ test "decoder" <| always decoder
        , test "mapped to Effect" <| always mapped
        ]


json : String
json =
    """
    {
        "_links": {
            "operation": {
                "href": "https://horizon-testnet.stellar.org/operations/10157597659137"
            },
            "succeeds": {
                "href": "https://horizon-testnet.stellar.org/effects?order=desc&cursor=10157597659137-1"
            },
            "precedes": {
                "href": "https://horizon-testnet.stellar.org/effects?order=asc&cursor=10157597659137-1"
            }
        },
        "id": "0000010157597659137-0000000001",
        "paging_token": "10157597659137-1",
        "account": "GBS43BF24ENNS3KPACUZVKK2VYPOZVBQO2CISGZ777RYGOPYC2FT6S3K",
        "type": "account_debited",
        "type_i": 3,
        "created_at": "2017-03-20T19:50:52Z",
        "asset_type": "native",
        "amount": "10000.0000000"
    }
    """


record : AccountDebited
record =
    { id = "0000010157597659137-0000000001"
    , pagingToken = "10157597659137-1"
    , type_ = "account_debited"
    , typeI = 3
    , account = "GBS43BF24ENNS3KPACUZVKK2VYPOZVBQO2CISGZ777RYGOPYC2FT6S3K"
    , assetType = AssetType.Native
    , amount = "10000.0000000"
    , createdAt = Date.fromTime <| Time.second * 1490039452
    , links =
        { operation = { href = "https://horizon-testnet.stellar.org/operations/10157597659137", templated = False }
        , succeeds = { href = "https://horizon-testnet.stellar.org/effects?order=desc&cursor=10157597659137-1", templated = False }
        , precedes = { href = "https://horizon-testnet.stellar.org/effects?order=asc&cursor=10157597659137-1", templated = False }
        }
    }


decoder : Expectation
decoder =
    json
        |> Decode.decodeString AccountDebited.decoder
        |> Expect.equal (Ok record)


mapped : Expectation
mapped =
    json
        |> Decode.decodeString Effect.decoder
        |> Expect.equal (Ok <| Effect.AccountDebited record)