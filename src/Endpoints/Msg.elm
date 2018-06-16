module Endpoints.Msg exposing (Msg (..))

import Form.Input as Input

import Endpoints.AccountDetails.Msg as AccountDetails
import Endpoints.AllAssets.Msg as AllAssets
import Endpoints.DataForAccount.Msg as DataForAccount


type Msg
    = UpdateEndpoint Input.Msg
    | AccountDetailsMsg AccountDetails.Msg
    | AllAssetsMsg AllAssets.Msg
    | DataForAccountMsg DataForAccount.Msg