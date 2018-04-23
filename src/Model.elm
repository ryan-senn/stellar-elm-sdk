module Model exposing (Model, initialModel)


type alias Model =
    { thing : String
    }


initialModel : Model
initialModel =
    { thing = ""
    }