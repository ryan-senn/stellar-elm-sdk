module Helpers.String exposing (toHyphen, toWords)

import Char


toHyphen : String -> String
toHyphen string =

    string
        |> String.toList
        |> List.indexedMap (\index char -> splitUpper (index == 0) "-" True char)
        |> String.concat


toWords : String -> String
toWords string =

    string
        |> String.toList
        |> List.indexedMap (\index char -> splitUpper (index == 0) " " False char)
        |> String.concat


splitUpper : Bool -> String -> Bool -> Char -> String
splitUpper isFirst splitter toLower char =

    case (Char.isUpper char, toLower) of

        (True, True) ->
            if isFirst then String.fromChar (Char.toLower char) else splitter ++ String.fromChar (Char.toLower char)

        (True, False) ->
            if isFirst then String.fromChar char else splitter ++ String.fromChar char

        _ ->
            String.fromChar char