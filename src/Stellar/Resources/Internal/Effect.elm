module Stellar.Resources.Internal.Effect exposing (decoder)

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode
import Stellar.Resources.Effect exposing (Effect(..))
import Stellar.Resources.Effects.Internal.AccountCreated as AccountCreated
import Stellar.Resources.Effects.Internal.AccountCredited as AccountCredited
import Stellar.Resources.Effects.Internal.AccountDebited as AccountDebited
import Stellar.Resources.Effects.Internal.AccountFlagsUpdated as AccountFlagsUpdated
import Stellar.Resources.Effects.Internal.AccountHomeDomainUpdated as AccountHomeDomainUpdated
import Stellar.Resources.Effects.Internal.AccountInflationDestinationUpdated as AccountInflationDestinationUpdated
import Stellar.Resources.Effects.Internal.AccountRemoved as AccountRemoved
import Stellar.Resources.Effects.Internal.AccountThresholdsUpdated as AccountThresholdsUpdated
import Stellar.Resources.Effects.Internal.DataCreated as DataCreated
import Stellar.Resources.Effects.Internal.DataRemoved as DataRemoved
import Stellar.Resources.Effects.Internal.DataUpdated as DataUpdated
import Stellar.Resources.Effects.Internal.OfferCreated as OfferCreated
import Stellar.Resources.Effects.Internal.OfferRemoved as OfferRemoved
import Stellar.Resources.Effects.Internal.OfferUpdated as OfferUpdated
import Stellar.Resources.Effects.Internal.SignerCreated as SignerCreated
import Stellar.Resources.Effects.Internal.SignerRemoved as SignerRemoved
import Stellar.Resources.Effects.Internal.Trade as Trade
import Stellar.Resources.Effects.Internal.TrustlineAuthorised as TrustlineAuthorised
import Stellar.Resources.Effects.Internal.TrustlineCreated as TrustlineCreated
import Stellar.Resources.Effects.Internal.TrustlineDeauthorised as TrustlineDeauthorised
import Stellar.Resources.Effects.Internal.TrustlineRemoved as TrustlineRemoved
import Stellar.Resources.Effects.Internal.TrustlineUpdated as TrustlineUpdated


decoder : Decoder Effect
decoder =
    Decode.field "type" Decode.string
        |> Decode.andThen effectFromType


effectFromType : String -> Decoder Effect
effectFromType type_ =
    case type_ of
        "account_created" ->
            Decode.map AccountCreated AccountCreated.decoder

        "account_credited" ->
            Decode.map AccountCredited AccountCredited.decoder

        "account_debited" ->
            Decode.map AccountDebited AccountDebited.decoder

        "account_flags_updated" ->
            Decode.map AccountFlagsUpdated AccountFlagsUpdated.decoder

        "account_home_domain_updated" ->
            Decode.map AccountHomeDomainUpdated AccountHomeDomainUpdated.decoder

        "account_inflation_destination_updated" ->
            Decode.map AccountInflationDestinationUpdated AccountInflationDestinationUpdated.decoder

        "account_removed" ->
            Decode.map AccountRemoved AccountRemoved.decoder

        "account_thresholds_updated" ->
            Decode.map AccountThresholdsUpdated AccountThresholdsUpdated.decoder

        "data_created" ->
            Decode.map DataCreated DataCreated.decoder

        "data_removed" ->
            Decode.map DataRemoved DataRemoved.decoder

        "data_updated" ->
            Decode.map DataUpdated DataUpdated.decoder

        "offer_created" ->
            Decode.map OfferCreated OfferCreated.decoder

        "offer_removed" ->
            Decode.map OfferRemoved OfferRemoved.decoder

        "offer_updated" ->
            Decode.map OfferUpdated OfferUpdated.decoder

        "signer_created" ->
            Decode.map SignerCreated SignerCreated.decoder

        "signer_removed" ->
            Decode.map SignerRemoved SignerRemoved.decoder

        "trade" ->
            Decode.map Trade Trade.decoder

        "trustline_authorised" ->
            Decode.map TrustlineAuthorised TrustlineAuthorised.decoder

        "trustline_created" ->
            Decode.map TrustlineCreated TrustlineCreated.decoder

        "trustline_deauthorised" ->
            Decode.map TrustlineDeauthorised TrustlineDeauthorised.decoder

        "trustline_removed" ->
            Decode.map TrustlineRemoved TrustlineRemoved.decoder

        "trustline_updated" ->
            Decode.map TrustlineUpdated TrustlineUpdated.decoder

        _ ->
            Decode.fail "Could not decode Effect"
