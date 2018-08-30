module Stellar.Resources.Page exposing (Page, Embed, Links)

{-| Page Resource


# Type alias

@docs Page, Embed, Links

-}

import Stellar.Link exposing (Link)


{-| Page

A Page can contain any embedded Resources and Links for navigation.

-}
type alias Page a =
    { embedded_ : { records : List a }
    , links_ : Links
    }


{-| Embed
-}
type alias Embed a =
    { records : List a
    }


{-| Links
-}
type alias Links =
    { self : Link
    , prev : Link
    , next : Link
    }
