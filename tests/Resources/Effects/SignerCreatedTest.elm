module Resources.Effects.SignerCreatedTest exposing (suite)

import Test exposing (..)
import Expect exposing (Expectation)

import Json.Decode as Decode

import Time

import Stellar.Resources.Effect as Effect exposing (Effect)
import Stellar.Resources.Internal.Effect as Effect

import Stellar.Resources.Effects.SignerCreated exposing (SignerCreated)
import Stellar.Resources.Effects.Internal.SignerCreated as SignerCreated


suite : Test
suite =
    describe "Test Resources.Effects.SignerCreatedTest"
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
    , publicKey = "GBS43BF24ENNS3KPACUZVKK2VYPOZVBQO2CISGZ777RYGOPYC2FT6S3K"
    , key = ""
    , createdAt = Time.millisToPosix <| 1490039452 * 1000
    , links =
        { operation = { href = "https://horizon-testnet.stellar.org/operations/10157597659137", templated = False }
        , succeeds = { href = "https://horizon-testnet.stellar.org/effects?order=desc&cursor=10157597659137-1", templated = False }
        , precedes = { href = "https://horizon-testnet.stellar.org/effects?order=asc&cursor=10157597659137-1", templated = False }
        }
    }


decoder : Expectation
decoder =
    json
        |> Decode.decodeString SignerCreated.decoder
        |> Expect.equal (Ok record)


mapped : Expectation
mapped =
    json
        |> Decode.decodeString Effect.decoder
        |> Expect.equal (Ok <| Effect.SignerCreated record)