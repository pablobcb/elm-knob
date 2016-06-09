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
    = ValueChange (Float -> Cmd Msg)



-- VIEW


view : (Float -> Cmd Msg) -> Model -> Html Msg
view cmdEmmiter model =
    div []
        [ div [] [ text (toString model.value) ]
        , button [ onClick (ValueChange cmdEmmiter) ] [ Html.text "Click" ]
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update message model =
    case message of
        ValueChange cmdEmmiter ->
            let
                newValue =
                    model.value + 1
            in
                ( { model | value = newValue }, cmdEmmiter newValue )
