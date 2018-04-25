module Routes exposing (Route (..), Endpoint (..), fromLocation, href, modifyUrl, isActiveRoute)

import Html.Styled exposing (Attribute)
import Html.Styled.Attributes as Attributes

import Navigation exposing (Location)

import UrlParser as Url exposing ((</>), Parser)


type Route
    = Home
    | Endpoints Endpoint


type Endpoint
    = AccountDetails
    | AllAssets


route : Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home (Url.s "")
        , Url.map (Endpoints AccountDetails) (Url.s "endpoints" </> Url.s "account-details")
        , Url.map (Endpoints AllAssets) (Url.s "endpoints" </> Url.s "all-assets")
        ]


routeToString : Route -> String
routeToString page =

    case page of

        Home ->
            "#/"

        Endpoints AccountDetails ->
            "#/endpoints/account-details"

        Endpoints AllAssets ->
            "#/endpoints/all-assets"


href : Route -> Attribute msg
href route =
    Attributes.href (routeToString route)


modifyUrl : Route -> Cmd msg
modifyUrl =
    routeToString >> Navigation.modifyUrl


fromLocation : Location -> Maybe Route
fromLocation location =
    if String.isEmpty location.hash then
        Just Home
    else
        Url.parseHash route location


isActiveRoute : Maybe Route -> Route -> Bool
isActiveRoute mRoute route =

    mRoute == Just route