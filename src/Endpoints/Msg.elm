module Endpoints.Msg exposing (Msg (..))

import Endpoints.AccountDetails.Msg as AccountDetails


type Msg
    = AccountDetailsMsg AccountDetails.Msg