module Stellar.Http.Accounts exposing (requestSingleAccount, RequestSingleAccountResponse, RequestSingleAccountResponse (..))

import Http

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.PublicKey as PublicKey exposing (PublicKey)
import Stellar.Endpoint as Endpoint exposing (Endpoint)
import Stellar.Thresholds as Thresholds exposing (Thresholds)
import Stellar.Flags as Flags exposing (Flags)
import Stellar.Balance as Balance exposing (Balance)
import Stellar.Signer as Signer exposing (Signer)
import Stellar.Links as Links exposing (Links)

import Stellar.Http.Error as Error exposing (Error)


requestSingleAccount : Endpoint -> PublicKey -> (Result Http.Error RequestSingleAccountResponse -> msg) -> Cmd msg
requestSingleAccount endpoint publicKey msg =

    let
        url =
            Endpoint.toString endpoint
            ++ "/accounts/"
            ++ PublicKey.toString publicKey

        request =
            Http.get url requestSingleAccountResponseDecoder

    in
        Http.send msg request


type RequestSingleAccountResponse
    = Error Error
    | Account AccountBody


requestSingleAccountResponseDecoder : Decoder RequestSingleAccountResponse
requestSingleAccountResponseDecoder =
    Decode.oneOf
        [ errorDecoder
        , accountDecoder
        ]


errorDecoder : Decoder RequestSingleAccountResponse
errorDecoder =
    Decode.map Error Error.errorDecoder


accountDecoder : Decoder RequestSingleAccountResponse
accountDecoder =
    Decode.map Account accountBodyDecoder


type alias AccountBody =
    { links : Links
    , id : PublicKey
    , pagingToken : String
    , accountId : PublicKey
    , sequence : String
    , subentryCount : Int
    , thresholds : Thresholds
    , flags : Flags
    , balances : List Balance
    , signers : List Signer
    }


accountBodyDecoder : Decoder AccountBody
accountBodyDecoder =
    Decode.decode AccountBody
        |> Decode.required "_links" Links.decoder
        |> Decode.required "id" PublicKey.decoder
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "account_id" PublicKey.decoder
        |> Decode.required "sequence" Decode.string
        |> Decode.required "subentry_count" Decode.int
        |> Decode.required "thresholds" Thresholds.decoder
        |> Decode.required "flags" Flags.decoder
        |> Decode.required "balances" (Decode.list Balance.decoder)
        |> Decode.required "signers" (Decode.list Signer.decoder)