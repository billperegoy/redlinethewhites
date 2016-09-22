module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Ports exposing (..)
import Accordion exposing (..)


main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { accordion1 : Accordion.Model
    , accordion2 : Accordion.Model
    }


type Msg
    = NoOp
    | Accordion1 Accordion.Msg
    | Accordion2 Accordion.Msg


initAccordionData : List (AccordionData Accordion.Msg)
initAccordionData =
    [ AccordionData "Accordion Item 1"
        [ accordionSubItem [ text "Sub Item 1" ]
        , accordionSubItem [ text "Sub Item 2" ]
        , accordionSubItem [ text "Sub Item 3" ]
        ]
    , AccordionData "Accordion Item 2"
        [ accordionSubItem [ text "Sub Item 4" ]
        , accordionSubItem [ text "Sub Item 5" ]
        , accordionSubItem [ text "Sub Item 6" ]
        ]
    , AccordionData "Accordion Item 3"
        [ accordionSubItem [ text "Sub Item 7" ]
        , accordionSubItem [ text "Sub Item 8" ]
        , accordionSubItem [ text "Sub Item 9" ]
        , accordionSubItem [ text "Sub Item 10" ]
        , accordionSubItem [ text "Sub Item 11" ]
        , accordionSubItem [ text "Sub Item 12" ]
        ]
    , AccordionData "Accordion Item 4"
        [ accordionSubItem [ text "Sub Item 13" ]
        , accordionSubItem [ text "Sub Item 14" ]
        , accordionSubItem [ text "Sub Item 15" ]
        ]
    ]


update : Msg -> Model -> ( Model, Cmd a )
update msg model =
    case msg of
        NoOp ->
            model ! []

        Accordion1 msg ->
            let
                ( result, cmd ) =
                    Accordion.update msg model.accordion1
            in
                { model | accordion1 = result } ! [ cmd ]

        Accordion2 msg ->
            let
                ( result, cmd ) =
                    Accordion.update msg model.accordion2
            in
                { model | accordion2 = result } ! [ cmd ]


init : ( Model, Cmd Msg )
init =
    { accordion1 = fst Accordion.init
    , accordion2 = fst Accordion.init
    }
        ! []


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Hello world" ]
        , App.map Accordion1 (Accordion.view model.accordion1 initAccordionData)
        , App.map Accordion2 (Accordion.view model.accordion2 initAccordionData)
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch []
