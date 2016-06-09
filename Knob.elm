module Knob exposing (..)

-- where

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


-- MODEL


type alias Model =
    { value : Float
    , min : Float
    , max : Float
    , step : Float
    }


initialModel : Model
initialModel =
    { value = 50
    , min = 0
    , max = 100
    , step = 1
    }


type Msg
    = Increase
    | Decrease



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (toString model.value) ]
        , button [ onClick Increase ] [ Html.text "Click" ]
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        Increase ->
            ( { model | value = model.value + 1 }, Cmd.none )

        Decrease ->
            ( { model | value = model.value - 1 }, Cmd.none )
