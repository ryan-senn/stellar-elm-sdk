module Endpoints.DataForAccount.Model exposing (Model, initialModel, Settings)

import Http

import Form.Input as Input
import Form.Select as Select

import Stellar.Endpoints.DataForAccount as DataForAccount


type alias Model =
    { settings : Settings
    , isLoading : Bool
    , response : Maybe (Result Http.Error DataForAccount.Response)
    }


initialModel : Model
initialModel =
    { settings = initialSettings
    , isLoading = False
    , response = Nothing
    }


type alias Settings =
    { publicKey : Input.Model
    , dataKey : Select.Model DataForAccount.DataKey
    }


initialSettings : Settings
initialSettings =
    { publicKey = Input.init
    , dataKey = Select.init DataForAccount.dataKeyList
    }