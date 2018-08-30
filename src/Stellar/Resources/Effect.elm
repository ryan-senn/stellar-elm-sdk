module Stellar.Resources.Effect exposing (Effect(..))

{-| Effect Resource


# Union Type

@docs Effect

-}

import Stellar.Resources.Effects.AccountCreated exposing (AccountCreated)
import Stellar.Resources.Effects.AccountCredited exposing (AccountCredited)
import Stellar.Resources.Effects.AccountDebited exposing (AccountDebited)
import Stellar.Resources.Effects.AccountFlagsUpdated exposing (AccountFlagsUpdated)
import Stellar.Resources.Effects.AccountHomeDomainUpdated exposing (AccountHomeDomainUpdated)
import Stellar.Resources.Effects.AccountInflationDestinationUpdated exposing (AccountInflationDestinationUpdated)
import Stellar.Resources.Effects.AccountRemoved exposing (AccountRemoved)
import Stellar.Resources.Effects.AccountThresholdsUpdated exposing (AccountThresholdsUpdated)
import Stellar.Resources.Effects.DataCreated exposing (DataCreated)
import Stellar.Resources.Effects.DataRemoved exposing (DataRemoved)
import Stellar.Resources.Effects.DataUpdated exposing (DataUpdated)
import Stellar.Resources.Effects.OfferCreated exposing (OfferCreated)
import Stellar.Resources.Effects.OfferRemoved exposing (OfferRemoved)
import Stellar.Resources.Effects.OfferUpdated exposing (OfferUpdated)
import Stellar.Resources.Effects.SignerCreated exposing (SignerCreated)
import Stellar.Resources.Effects.SignerRemoved exposing (SignerRemoved)
import Stellar.Resources.Effects.Trade exposing (Trade)
import Stellar.Resources.Effects.TrustlineAuthorised exposing (TrustlineAuthorised)
import Stellar.Resources.Effects.TrustlineCreated exposing (TrustlineCreated)
import Stellar.Resources.Effects.TrustlineDeauthorised exposing (TrustlineDeauthorised)
import Stellar.Resources.Effects.TrustlineRemoved exposing (TrustlineRemoved)
import Stellar.Resources.Effects.TrustlineUpdated exposing (TrustlineUpdated)


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
