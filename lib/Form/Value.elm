module Form.Value exposing
    ( Value
    , init, update
    , getValue, getOriginalValue, isChanged
    , reset
    )


type Value a
    = Unchanged a
    | Changed a a


init : a -> Value a
init =
    Unchanged


update : a -> Value a -> Value a
update newValue current =

    case current of

        Unchanged currentValue ->
            case newValue == currentValue of

                True ->
                    current

                False ->
                    Changed currentValue newValue

        Changed originalValue currentValue ->

            case currentValue == newValue of

                True ->
                    current

                False ->
                    case originalValue == newValue of

                        True ->
                            Unchanged originalValue

                        False ->
                            Changed originalValue newValue


getValue : Value a -> a
getValue value =

    case value of

        Unchanged value ->
            value

        Changed _ value ->
            value


getOriginalValue : Value a -> a
getOriginalValue value =

    case value of

        Unchanged value ->
            value

        Changed value _ ->
            value


isChanged : Value a -> Bool
isChanged value =

    case value of

        Changed _ _ ->
            True

        Unchanged _ ->
            False


reset : Value a -> Value a
reset =
    getOriginalValue >> Unchanged