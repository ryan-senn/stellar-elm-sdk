module Form.TextInput exposing
    ( Model, init
    , Msg, update
    , view, render
    , setValue
    , reset, reInitialize
    , setIsError, setIsLocked
    , getValue, getIsChanged
    )

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

import Form.Value as Value exposing (Value)

import Regex exposing (Regex)


-- MODEL --


type Model
    = Model InternalState


type alias InternalState =
    { value : Value String
    }


init : Model
init =
    Model { value = Value.init "" }


type View
    = View ViewState InternalState


type alias ViewState =
    { isShown : Bool
    , isLocked : Bool
    , isError : Bool
    }


initialViewState : ViewState
initialViewState =
    { isShown = True
    , isLocked = False
    , isError = False
    }


-- UPDATE --


type Msg
    = Input String


update : Msg -> Model -> Model
update (Input string) (Model internalState) =

    Model { internalState | value = Value.update string internalState.value }


-- VIEW --


view : Model -> View
view (Model internalState) =

    View initialViewState internalState


viewIf : Bool -> Model -> View
viewIf isShown (Model internalState) =

    View { initialViewState | isShown = isShown } internalState


render : View -> Html Msg
render (View viewState internalState) =

    case viewState.isShown of

        True ->
            input
                [ class "form-control"
                , disabled viewState.isLocked
                , value (Value.getValue internalState.value)
                , onInput Input
                ]
                []

        False ->
            text ""


-- GETTERS --


getValue : Model -> String
getValue (Model internalState) =

    Value.getValue internalState.value


getIsChanged : Model -> Bool
getIsChanged (Model internalState) =

    Value.isChanged internalState.value


-- SETTERS --


setValue : String -> Model -> Model
setValue value (Model internalState) =

    Model { internalState | value = Value.init value }


reInitialize : Model -> Model
reInitialize (Model internalState) =

    Model { internalState | value = Value.init (Value.getValue internalState.value) }


reset : Model -> Model
reset (Model internalState) =

    Model { internalState | value = Value.reset internalState.value }


-- VIEW SETTERS --


setIsLocked : Bool -> View -> View
setIsLocked isLocked (View viewState internalState) =

    View { viewState | isLocked = isLocked } internalState


setIsError : Bool -> View -> View
setIsError isError (View viewState internalState) =

    View { viewState | isError = isError } internalState