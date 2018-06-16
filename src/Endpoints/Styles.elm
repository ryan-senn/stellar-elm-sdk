module Endpoints.Styles exposing (..)

import Msg exposing (Msg)

import Css exposing (..)
import Html.Styled exposing (Attribute)
import Html.Styled.Attributes exposing (css)

import Styles exposing ((?))


page : Attribute Msg
page =
    css
        [ padding2 (px 10) (px 40)
        ]


titleContainer : Attribute Msg
titleContainer =
    css
        [ borderBottom3 (px 1) solid (hex "dedfe0")
        , padding2 (px 20) (px 40)
        , displayFlex
        , alignItems flexEnd
        ]


title : Attribute Msg
title =
    css
        [ margin (px 0)
        ]


officialLink : Attribute Msg
officialLink =
    css
        [ marginLeft <| px 10
        , lineHeight <| em 1.7
        , marginBottom <| px 4
        ]


response : Attribute Msg
response =
    css
        [ maxWidth <| calc (vw 100) minus (px 350)
        ]


request : Attribute Msg
request =
    css
        [ displayFlex
        , marginTop (px 15)
        ]


requestType : Attribute Msg
requestType =
    css
        [ padding2 (px 8) (px 12)
        , backgroundColor (hex "f6f6f6f6")
        , border3 (px 1) solid (hex "dfdfdfdf")
        , borderRightWidth (px 0)
        ]


requestUrl : Attribute Msg
requestUrl =
    css
        [ cursor pointer
        , flexGrow (int 1)
        , padding2 (px 8) (px 12)
        , border3 (px 1) solid (hex "dfdfdfdf")
        , property "word-break" "break-word"
        ]


requestButton : Bool -> Attribute Msg
requestButton isLoading =
    css
        [ backgroundColor (hex "ffffff")
        , padding2 (px 8) (px 12)
        , border3 (px 1) solid (hex "dfdfdfdf")
        , marginTop (px 15)
        , cursor pointer ? not isLoading
        , fontSize (px 14)
        , borderRadius (px 3)
        , outlineWidth (px 0)
        ]


label : Attribute Msg
label =
    css
        [ marginTop (px 15)
        , marginBottom (px 3)
        , display block
        ]


labelMandatory : Attribute Msg
labelMandatory =
    css
        [ after
            [ property "content" "\" *\"" ]
        ]


labelExample : Attribute Msg
labelExample =
    css
        [ color (hex "777777")
        , marginLeft (px 10)
        ]


radioButton : Bool -> Attribute Msg
radioButton isSelected =
    css
        [ padding2 (px 8) (px 12)
        , backgroundColor (if isSelected then hex "e6f8fc" else hex "ffffff")
        , outlineWidth (px 0)
        , cursor pointer
        , border3 (px 1) solid (hex "dddddd")
        , display inlineBlock
        , marginRight (px 5)
        , borderRadius (px 3)
        ]