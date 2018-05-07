module Endpoints.Model exposing (Model, initialModel)

import Endpoints.AccountDetails.Model as AccountDetails


type alias Model =
    { accountDetails : AccountDetails.Model
    }


initialModel : Model
initialModel =
    { accountDetails = AccountDetails.initialModel
    }