module Styles exposing (..)

import Msg exposing (Msg)

import Css exposing (..)
import Html.Styled exposing (Attribute)
import Html.Styled.Attributes exposing (css)


(?) : Style -> Bool -> Style
(?) style shouldDisplay =

     case shouldDisplay of

        True ->
            style

        False ->
            resize none


layout : Attribute Msg
layout =
    css
        [ displayFlex
        , flexDirection column
        ]


header : Attribute Msg
header =
    css
        [ displayFlex
        , padding <| em 1
        ]


title : Attribute Msg
title =
    css
        [ margin <| px 0
        ]


stellarTitle : Attribute Msg
stellarTitle =
    css
        [ color <| hex "08b5e5"
        , fontWeight <| int 700
        , fontSize <| Css.em 1.2
        , cursor pointer
        , textDecoration none
        ]


elmTitle : Attribute Msg
elmTitle =
    css
        [ color <| hex "666666"
        , fontSize <| Css.em 0.8
        , fontWeight <| int 500
        , marginLeft <| px 10
        , cursor pointer
        , textDecoration none
        ]


body : Attribute Msg
body =
    css
        [ displayFlex
        , borderTop3 (px 1) solid (hex "dedfe0")
        ]


sidebar : Attribute Msg
sidebar =
    css
        [ backgroundColor <| hex "e6f8fc"
        , padding2 (px 20) (px 0)
        ]


sidebarTitle : Attribute Msg
sidebarTitle =
    css
        [ margin2 (px 5) (px 20)
        ]


sidebarList : Attribute Msg
sidebarList =
    css
        [ listStyleType none
        , padding <| px 0
        , margin2 (px 10) (px 0)
        ]


sidebarItem : Bool -> Attribute Msg
sidebarItem isSelected =
    css
        [ backgroundColor (hex "ffffff") ? isSelected
        , borderLeft3 (px 10) solid (hex "08b5e5") ? isSelected
        , borderLeft3 (px 10) solid transparent ? not isSelected
        ]


sidebarItemLink : Attribute Msg
sidebarItemLink =
    css
        [ padding4 (px 3) (px 30) (px 3) (px 25)
        , cursor pointer
        , hover
            [ textDecoration underline
            ]
        , whiteSpace noWrap
        , width (pct 100)
        , display block
        ]


content : Attribute Msg
content =
    css
        [ flexGrow <| int 1
        ]


home : Attribute Msg
home =
    css
        [ padding <| px 25
        ]