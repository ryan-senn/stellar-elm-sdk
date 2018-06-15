module Routes exposing (Route (..), fromLocation, href, modifyUrl, isActiveRoute)

import Html.Styled exposing (Attribute)
import Html.Styled.Attributes as Attributes

import Navigation exposing (Location)

import UrlParser as Url exposing ((</>), Parser)

import String.Extra as String

import Endpoints exposing (Endpoint)


type Route
    = Home
    | Endpoints Endpoint


endpointParser : Endpoint -> Parser (Route -> a) a
endpointParser endpoint =
    Url.map (Endpoints endpoint) (Url.s "endpoints" </> Url.s (toString endpoint |> String.decapitalize |> String.dasherize))


routeToString : Route -> String
routeToString page =

    case page of

        Endpoints endpoint ->
            "#/endpoints/" ++ (toString endpoint |> String.decapitalize |> String.dasherize)

        _ ->
            "#/"


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
        Url.parseHash routeParser location


routeParser : Parser (Route -> a) a
routeParser =
    Url.oneOf ([ Url.s "" |> Url.map Home ] ++ List.map endpointParser Endpoints.asList)


isActiveRoute : Maybe Route -> Route -> Bool
isActiveRoute mRoute route =
    mRoute == Just route