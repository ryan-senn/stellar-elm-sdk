module RecordFormatter exposing (toString)

import String


toString : record -> String
toString =
    Basics.toString >> String.toList >> List.foldl format (Accumulator "" 0) >> .string


type alias Accumulator =
    { string : String
    , indentation : Int
    }


format : Char -> Accumulator -> Accumulator
format char acc =
    case char of
        '(' -> newLine '(' 4 4 acc
        '[' -> newLine '[' 4 4 acc
        '{' -> newLine '{' 4 4 acc
        ')' -> newLine ')' 0 -4 acc
        ']' -> newLine ']' 0 -4 acc
        '}' -> newLine '}' 0 -4 acc
        ',' -> newLine ',' 0 0 acc
        other -> { acc | string = acc.string ++ String.fromChar other }


newLine : Char -> Int -> Int -> Accumulator -> Accumulator
newLine char indentation nextIndentation acc =
    { acc
        | string = acc.string ++ "\n" ++ String.repeat (acc.indentation + indentation) " " ++ String.fromChar char
        , indentation = acc.indentation + nextIndentation
    }