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
    { knobModel = Knob.initialModel }


init : ( AppModel, Cmd Msg )
init =
    ( initialModel, Cmd.none )


type Msg
    = KnobMsg Knob.Msg



-- VIEW


view : AppModel -> Html Msg
view model =
    Html.div []
        [ Html.App.map KnobMsg
            (Knob.view (\value -> examplePort value)
                model.knobModel
            )
        ]



-- UPDATE


update : Msg -> AppModel -> ( AppModel, Cmd Msg )
update message model =
    case message of
        KnobMsg subMsg ->
            let
                ( updatedKnobModel, knobCmd ) =
                    Knob.update subMsg model.knobModel
            in
                ( { model | knobModel = updatedKnobModel }
                , Cmd.map KnobMsg knobCmd
                )



-- SUBSCIPTIONS


subscriptions : AppModel -> Sub Msg
subscriptions model =
    Sub.none


port examplePort : Float -> Cmd msg



-- APP


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
