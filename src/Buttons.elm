module Buttons exposing (main)

-- Press buttons to increment and decrement a counter.
--
-- An example from the Official Guide but with elm-ui. The original example:
--   https://guide.elm-lang.org/architecture/buttons.html
--

import Browser
import Element
    exposing
        ( Element
        , centerX
        , column
        , el
        , fill
        , layout
        , text
        , width
        )
import Element.Font as Font
import Element.Input exposing (button)
import Html exposing (Html)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- Help text Element


centerXText : String -> Element Msg
centerXText str =
    el [ centerX, Font.size 48 ] <| text str



-- VIEW


view : Model -> Html Msg
view model =
    layout [] <|
        column [ width fill ]
            [ button [ width fill ]
                { onPress = Just Decrement
                , label = centerXText "-"
                }
            , el [ width fill ] <| centerXText <| String.fromInt model
            , button [ width fill ]
                { onPress = Just Increment
                , label = centerXText "+"
                }
            ]
