module Stellar.Error exposing (Error, StandardError (..))

{-| Record representing possible Errors in Stellar

# Type alias
@docs Error

# Standard Errors
@docs StandardError

-}


{-| Type alias
-}
type alias Error =
    { type_ : String
    , title : String
    , status : Int
    , detail : String
    , instance : Maybe String
    }


{-| Union Type representing the Standard Errors in Stellar
-}
type StandardError
    = ServerError Error
    | RateLimitExceeded Error
    | Forbidden Error