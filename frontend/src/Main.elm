module Main exposing (..)

import Html exposing (..)
import Html.App as App


main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    Int


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd a )
update msg model =
    case msg of
        NoOp ->
            model ! []


init : ( Model, Cmd Msg )
init =
    1 ! []


view : Model -> Html Msg
view model =
    div [] [ text "Hello world" ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch []
