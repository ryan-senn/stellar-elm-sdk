module Stellar.Sorting exposing (Sorting(..), toString)

{-| Union Type that represents the available sorting methods in Stellar


# Union Type and Decoder

@docs Sorting, toString

-}


{-| Union Type
-}
type Sorting
    = Asc
    | Desc


{-| Helper function to print the sorting
-}
toString : Sorting -> String
toString sorting =
    case sorting of
        Asc ->
            "asc"

        Desc ->
            "desc"
