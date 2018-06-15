module Helpers.Html.Attributes exposing ((?))

import Html.Styled exposing (Attribute)
import Html.Styled.Attributes exposing (property)

import Json.Encode as Encode

import Msg exposing (Msg)


(?) : Attribute Msg -> Bool -> Attribute Msg
(?) attribute bool =

    case bool of
        True ->
            attribute

        False ->
            property "" (Encode.string "")