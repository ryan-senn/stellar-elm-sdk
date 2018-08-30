module Stellar.Resources.Internal.Account exposing (decoder, linksDecoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Internal.Balance as Balance
import Stellar.Internal.Endpoint as Endpoint
import Stellar.Internal.Flags as Flags
import Stellar.Internal.Link as Link
import Stellar.Internal.PublicKey as PublicKey
import Stellar.Internal.Signer as Signer
import Stellar.Internal.Thresholds as Thresholds
import Stellar.Resources.Account exposing (Account, Links)
import Stellar.Resources.Internal.Data as Data


decoder : Decoder Account
decoder =
    Decode.succeed Account
        |> Decode.required "id" PublicKey.decoder
        |> Decode.required "account_id" PublicKey.decoder
        |> Decode.required "sequence" Decode.string
        |> Decode.required "subentry_count" Decode.int
        |> Decode.required "balances" (Decode.list Balance.decoder)
        |> Decode.required "thresholds" Thresholds.decoder
        |> Decode.required "signers" (Decode.list Signer.decoder)
        |> Decode.required "data" Data.decoder
        |> Decode.required "flags" Flags.decoder
        |> Decode.required "paging_token" Decode.string
        |> Decode.required "_links" linksDecoder


linksDecoder : Decoder Links
linksDecoder =
    Decode.succeed Links
        |> Decode.optional "toml" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "data" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "effects" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "offers" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "operations" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "payments" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "self" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "trades" (Decode.maybe Link.decoder) Nothing
        |> Decode.optional "transactions" (Decode.maybe Link.decoder) Nothing
