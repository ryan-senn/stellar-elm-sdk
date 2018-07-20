module Resources.Effects.SignerCreatedTest exposing (suite)

import Test exposing (..)
import Expect exposing (Expectation)

import Json.Decode as Decode

import Date
import Time

import Stellar.PublicKey exposing (PublicKey (PublicKey))
import Stellar.Resources.Effects.SignerCreated as SignerCreated exposing (SignerCreated)


suite : Test
suite =
    describe "Test Resources.Effects.SignerCreatedTest"
        [ test "Success" <| always decoder ]


json : String
json =
    """
    {
        "_links": {
            "operation": {
                "href": "https://horizon-testnet.stellar.org/operations/10157597659137"
            },
            "succeeds": {
                "href": "https://horizon-testnet.stellar.org/effects?order=desc&0026cursor=10157597659137-1"
            },
            "precedes": {
                "href": "https://horizon-testnet.stellar.org/effects?order=asc&0026cursor=10157597659137-1"
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
    }
    """


record : SignerCreated
record =
    { id = "0000010157597659137-0000000003"
    , pagingToken = "10157597659137-3"
    , type_ = "signer_created"
    , typeI = 10
    , account = "GBS43BF24ENNS3KPACUZVKK2VYPOZVBQO2CISGZ777RYGOPYC2FT6S3K"
    , weight = 1
    , publicKey = PublicKey "GBS43BF24ENNS3KPACUZVKK2VYPOZVBQO2CISGZ777RYGOPYC2FT6S3K"
    , key = ""
    , createdAt = Date.fromTime <| Time.second * 1490039452
    , links =
        { operation = { href = "https://horizon-testnet.stellar.org/operations/10157597659137", templated = False }
        , succeeds = { href = "https://horizon-testnet.stellar.org/effects?order=desc&0026cursor=10157597659137-1", templated = False }
        , precedes = { href = "https://horizon-testnet.stellar.org/effects?order=asc&0026cursor=10157597659137-1", templated = False }
        }
    }


decoder : Expectation
decoder =
    json
        |> Decode.decodeString SignerCreated.decoder
        |> Expect.equal (Ok record)