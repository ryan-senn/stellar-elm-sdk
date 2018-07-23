module Resources.Effects.AccountCreatedTest exposing (suite)

import Test exposing (..)
import Expect exposing (Expectation)

import Json.Decode as Decode

import Date
import Time

import Stellar.Resources.Effect as Effect exposing (Effect)
import Stellar.Resources.Effects.AccountCreated as AccountCreated exposing (AccountCreated)


suite : Test
suite =
    describe "Test Resources.Effects.AccountCreatedTest"
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
        "type": "account_created",
        "type_i": 0,
        "created_at": "2017-03-20T19:50:52Z",
        "starting_balance": "50000000.0000000"
    }
    """


record : AccountCreated
record =
    { id = "0000010157597659137-0000000001"
    , pagingToken = "10157597659137-1"
    , type_ = "account_created"
    , typeI = 0
    , account = "GBS43BF24ENNS3KPACUZVKK2VYPOZVBQO2CISGZ777RYGOPYC2FT6S3K"
    , startingBalance = "50000000.0000000"
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
        |> Decode.decodeString AccountCreated.decoder
        |> Expect.equal (Ok record)


mapped : Expectation
mapped =
    json
        |> Decode.decodeString Effect.decoder
        |> Expect.equal (Ok <| Effect.AccountCreated record)