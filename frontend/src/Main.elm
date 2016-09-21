module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Accordion exposing (..)


main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { accordion : Accordion.Model }


type Msg
    = NoOp
    | Accordion Accordion.Msg


initAccordionData : List (AccordionData Msg)
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

        Accordion msg ->
            { model | accordion = fst (Accordion.update msg model.accordion) }
                ! []


init : ( Model, Cmd Msg )
init =
    { accordion = fst Accordion.init } ! []


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Hello world" ]
        , App.map Accordion (Accordion.view model.accordion)
          --, App.map (\e -> NoOp) (Accordion.view accordionModel)
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch []
