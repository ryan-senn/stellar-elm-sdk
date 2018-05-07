module Helpers.RecordFormatter exposing (toString)

import String


toString : record -> String
toString =
    Basics.toString >> String.toList >> List.foldl format (Accumulator "" 0 False False) >> .string


type alias Accumulator =
    { string : String
    , indentation : Int
    , isString : Bool
    , isEscaped : Bool
    }


type Indentation
    = Indent
    | Outdent
    | Keep


format : Char -> Accumulator -> Accumulator
format char acc =
    case (char, acc.isString, acc.isEscaped) of
        ('"', False, False) ->
            { acc | string = acc.string ++ String.fromChar char, isString = True }

        ('"', True, False) ->
            { acc | string = acc.string ++ String.fromChar char, isString = False }

        ('\\', True, False) ->
            { acc | string = acc.string ++ String.fromChar char, isEscaped = True }

        ('\\', True, True) ->
            { acc | string = acc.string ++ String.fromChar char, isEscaped = False }

        ('(', False, _) -> newLine '(' 4 4 acc
        ('[', False, _) -> newLine '[' 4 4 acc
        ('{', False, _) -> newLine '{' 4 4 acc
        (')', False, _) -> newLine ')' 0 -4 acc
        (']', False, _) -> newLine ']' 0 -4 acc
        ('}', False, _) -> newLine '}' 0 -4 acc
        (',', False, _) -> newLine ',' 0 0 acc
        (other, _, _) -> { acc | string = acc.string ++ String.fromChar other }


newLine : Char -> Int -> Int -> Accumulator -> Accumulator
newLine char indentation nextIndentation acc =
    { acc
        | string = acc.string ++ "\n" ++ String.repeat (acc.indentation + indentation) " " ++ String.fromChar char
        , indentation = acc.indentation + nextIndentation
    }