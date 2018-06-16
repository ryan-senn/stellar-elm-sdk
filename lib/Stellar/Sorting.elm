module Stellar.Sorting exposing (Sorting (..), toString)


type Sorting
    = Asc
    | Desc


toString : Sorting -> String
toString =
    Basics.toString >> String.toLower