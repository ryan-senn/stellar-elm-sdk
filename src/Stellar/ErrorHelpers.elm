module Stellar.ErrorHelpers exposing (flattenError)

{-| Error Helpers


# Utility

@docs flattenError

-}

import Http
import Json.Decode as Decode
import Stellar.Error exposing (Error)
import Stellar.Internal.Error exposing (decoder)


{-| Utility to flatten Errors. In Elm, Http requests return a `Result Http.Error response`.
When Stellar throws an Error, Elm interprets it as `Err (Http.BadStatus response)`.
We then need to at the response body and check for status code to return the correct Err.
-}
flattenError : Http.Error -> (Error -> response) -> Result Http.Error response
flattenError httpError ok =
    case httpError of
        Http.BadStatus response ->
            case Decode.decodeString decoder response.body of
                Ok error ->
                    Ok (ok error)

                Err _ ->
                    Err httpError

        _ ->
            Err httpError
