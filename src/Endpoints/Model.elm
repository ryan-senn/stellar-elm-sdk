module Endpoints.Model exposing (Model, initialModel)

import Form.Input as Input

import Endpoints.AccountDetails.Model as AccountDetails
import Endpoints.AllAssets.Model as AllAssets
import Endpoints.DataForAccount.Model as DataForAccount


type alias Model =
    { endpoint : Input.Model
    , accountDetails : AccountDetails.Model
    , allAssets : AllAssets.Model
    , dataForAccount : DataForAccount.Model
    }


initialModel : Model
initialModel =
    { endpoint = Input.init |> Input.setInitialValue "https://horizon-testnet.stellar.org"
    , accountDetails = AccountDetails.initialModel
    , allAssets = AllAssets.initialModel
    , dataForAccount = DataForAccount.initialModel
    }