port module Accordion exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import AccordionData exposing (..)


main =
    App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



--
-- Model
--


type alias Model =
    { accordionData : List (AccordionData Msg)
    }


init : ( Model, Cmd Msg )
init =
    Model
        [ AccordionData "Accordion Item 1"
            0
            [ accordionSubItem [ text "Sub Item 1" ]
            , accordionSubItem [ text "Sub Item 2" ]
            , accordionSubItem [ text "Sub Item 3" ]
            ]
        , AccordionData "Accordion Item 2"
            1
            [ accordionSubItem [ text "Sub Item 4" ]
            , accordionSubItem [ text "Sub Item 5" ]
            , accordionSubItem [ text "Sub Item 6" ]
            ]
        , AccordionData "Accordion Item 3"
            2
            [ accordionSubItem [ text "Sub Item 7" ]
            , accordionSubItem [ text "Sub Item 8" ]
            , accordionSubItem [ text "Sub Item 9" ]
            , accordionSubItem [ text "Sub Item 10" ]
            , accordionSubItem [ text "Sub Item 11" ]
            , accordionSubItem [ text "Sub Item 12" ]
            ]
        ]
        ! []



--
-- Update
--


type Msg
    = Toggle Int


update : Msg -> Model -> ( Model, Cmd a )
update msg model =
    case msg of
        Toggle id ->
            model ! [ toggleAccordion (itemIdString id) ]



--
-- View
--


accordionSubItem : List (Html a) -> Html a
accordionSubItem content =
    li []
        [ a [ href "javascript:void(0)" ] content
        ]


itemIdString : Int -> String
itemIdString id =
    "item-" ++ toString id


accordionItem : AccordionData Msg -> Html Msg
accordionItem data =
    li []
        [ a
            [ id (itemIdString data.id)
            , href "javascript:void(0)"
            , onClick (Toggle data.id)
            ]
            [ text data.label ]
        , ul
            [ class "submenu" ]
            data.items
        ]


view : Model -> Html Msg
view model =
    ul [ class "accordion" ]
        (List.map accordionItem model.accordionData)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch []


port toggleAccordion : String -> Cmd msg
