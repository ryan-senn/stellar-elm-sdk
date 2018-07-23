module Resources.PageTest exposing (suite)

import Test exposing (..)
import Expect exposing (Expectation)

import Json.Decode as Decode exposing (Decoder)

import Stellar.Resources.Page as Page exposing (Page)


suite : Test
suite =
    describe "Test Page"
        [ test "Decode Page" <| always test1
        ]


json : String
json =
    """
    {
        "_links": {
            "self": {
                "href": "https://horizon-testnet.stellar.org/effects?cursor=26&limit=1026&order=asc"
            },
            "next": {
                "href": "https://horizon-testnet.stellar.org/effects?cursor=10157597659140-126&limit=1026&order=asc"
            },
            "prev": {
                "href": "https://horizon-testnet.stellar.org/effects?cursor=10157597659137-126&limit=1026&order=desc"
            }
        },
        "_embedded": {
            "records" : [{ "id" : 4 }, { "id" : 16 }, { "id" : 19 }]
        }
    }
    """


record : Page Item
record =
    { embedded_ =
        { records =
            [ { id = 4 } , { id = 16 } , { id = 19 } ]
        }
    , links_ =
        { self = { href = "https://horizon-testnet.stellar.org/effects?cursor=26&limit=1026&order=asc", templated = False }
        , next = { href = "https://horizon-testnet.stellar.org/effects?cursor=10157597659140-126&limit=1026&order=asc", templated = False }
        , prev = { href = "https://horizon-testnet.stellar.org/effects?cursor=10157597659137-126&limit=1026&order=desc", templated = False }
        }
    }


type alias Item =
    { id : Int
    }


itemDecoder : Decoder Item
itemDecoder =
    Decode.field "id" Decode.int
        |> Decode.map Item


test1 : Expectation
test1 =
    Decode.decodeString (Page.decoder itemDecoder) json
        |> Expect.equal (Ok record)