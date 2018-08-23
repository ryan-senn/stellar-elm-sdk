module Resources.EffectTest exposing (suite)

import Test exposing (..)
import Expect exposing (Expectation)

import Json.Decode as Decode

import Stellar.Resources.Internal.Effect as Effect


suite : Test
suite =
    describe "Effect Test"
        [ test "decoder" <| always test1 ]


json : String
json =
    """
    [{
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
    },
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
        "type": "account_credited",
        "type_i": 3,
        "created_at": "2017-03-20T19:50:52Z",
        "asset_type": "native",
        "amount": "10000.0000000"
    },
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
        "id": "0000010157597659137-0000000003",
        "paging_token": "10157597659137-3",
        "account": "GBS43BF24ENNS3KPACUZVKK2VYPOZVBQO2CISGZ777RYGOPYC2FT6S3K",
        "type": "signer_created",
        "type_i": 10,
        "created_at": "2017-03-20T19:50:52Z",
        "weight": 1,
        "public_key": "GBS43BF24ENNS3KPACUZVKK2VYPOZVBQO2CISGZ777RYGOPYC2FT6S3K",
        "key": ""
    }]
    """


test1 : Expectation
test1 =
    Decode.decodeString (Decode.list Effect.decoder) json
        |> Result.map (always True) >> Result.withDefault False
        |> Expect.true "Decode failed."