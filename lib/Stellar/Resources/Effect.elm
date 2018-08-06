module Stellar.Resources.Effect exposing (Effect (..), decoder)

{-| Effect Resource

# Union Type and decoder
@docs Effect, decoder

-}

import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Decode

import Stellar.Resources.Effects.AccountCreated as AccountCreated exposing (AccountCreated)
import Stellar.Resources.Effects.AccountCredited as AccountCredited exposing (AccountCredited)
import Stellar.Resources.Effects.AccountDebited as AccountDebited exposing (AccountDebited)
import Stellar.Resources.Effects.AccountFlagsUpdated as AccountFlagsUpdated exposing (AccountFlagsUpdated)
import Stellar.Resources.Effects.AccountHomeDomainUpdated as AccountHomeDomainUpdated exposing (AccountHomeDomainUpdated)
import Stellar.Resources.Effects.AccountInflationDestinationUpdated as AccountInflationDestinationUpdated exposing (AccountInflationDestinationUpdated)
import Stellar.Resources.Effects.AccountRemoved as AccountRemoved exposing (AccountRemoved)
import Stellar.Resources.Effects.AccountThresholdsUpdated as AccountThresholdsUpdated exposing (AccountThresholdsUpdated)
import Stellar.Resources.Effects.DataCreated as DataCreated exposing (DataCreated)
import Stellar.Resources.Effects.DataRemoved as DataRemoved exposing (DataRemoved)
import Stellar.Resources.Effects.DataUpdated as DataUpdated exposing (DataUpdated)
import Stellar.Resources.Effects.OfferCreated as OfferCreated exposing (OfferCreated)
import Stellar.Resources.Effects.OfferRemoved as OfferRemoved exposing (OfferRemoved)
import Stellar.Resources.Effects.OfferUpdated as OfferUpdated exposing (OfferUpdated)
import Stellar.Resources.Effects.SignerCreated as SignerCreated exposing (SignerCreated)
import Stellar.Resources.Effects.SignerRemoved as SignerRemoved exposing (SignerRemoved)
import Stellar.Resources.Effects.Trade as Trade exposing (Trade)
import Stellar.Resources.Effects.TrustlineAuthorised as TrustlineAuthorised exposing (TrustlineAuthorised)
import Stellar.Resources.Effects.TrustlineCreated as TrustlineCreated exposing (TrustlineCreated)
import Stellar.Resources.Effects.TrustlineDeauthorised as TrustlineDeauthorised exposing (TrustlineDeauthorised)
import Stellar.Resources.Effects.TrustlineRemoved as TrustlineRemoved exposing (TrustlineRemoved)
import Stellar.Resources.Effects.TrustlineUpdated as TrustlineUpdated exposing (TrustlineUpdated)


{-| Union Type of all possible Effects
-}
type Effect
    = AccountCreated AccountCreated
    | AccountCredited AccountCredited
    | AccountDebited AccountDebited
    | AccountFlagsUpdated AccountFlagsUpdated
    | AccountHomeDomainUpdated AccountHomeDomainUpdated
    | AccountInflationDestinationUpdated AccountInflationDestinationUpdated
    | AccountRemoved AccountRemoved
    | AccountThresholdsUpdated AccountThresholdsUpdated
    | DataCreated DataCreated
    | DataRemoved DataRemoved
    | DataUpdated DataUpdated
    | OfferCreated OfferCreated
    | OfferRemoved OfferRemoved
    | OfferUpdated OfferUpdated
    | SignerCreated SignerCreated
    | SignerRemoved SignerRemoved
    | Trade Trade
    | TrustlineAuthorised TrustlineAuthorised
    | TrustlineCreated TrustlineCreated
    | TrustlineDeauthorised TrustlineDeauthorised
    | TrustlineRemoved TrustlineRemoved
    | TrustlineUpdated TrustlineUpdated


{-| Decoder
-}
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