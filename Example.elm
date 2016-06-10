port module Example exposing (..)

-- where

import Html exposing (Html)
import Html.App
import Knob


-- MODEL


type alias AppModel =
    { knobModel : Knob.Model }


initialModel : AppModel
initialModel =
    { knobModel = Knob.create 0 -100 100 1 }


init : ( AppModel, Cmd Msg )
init =
    ( initialModel, Cmd.none )


type Msg
    = KnobMsg Knob.Msg



-- VIEW


view : AppModel -> Html Msg
view model =
    Html.div []
        [ Knob.knob KnobMsg examplePort model.knobModel ]



-- UPDATE


updateKnob : Knob.Model -> AppModel -> AppModel
updateKnob knobModel model =
    { model | knobModel = knobModel }


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update message model =
    case message of
        KnobMsg subMsg ->
            Knob.updateMap model subMsg .knobModel updateKnob KnobMsg



-- SUBSCIPTIONS


subscriptions : AppModel -> Sub Msg
subscriptions model =
    Sub.none


port examplePort : Int -> Cmd msg



-- APP


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
