module Accordion exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Ports exposing (..)


--
-- Model
--


type alias AccordionData a =
    { label : String
    , items : List (Html a)
    }


type alias VisibilityElement =
    ( Int, Bool )


type alias Model =
    { visible : List VisibilityElement
    }


init : ( Model, Cmd Msg )
init =
    { visible =
        [ ( 0, False )
        , ( 1, False )
        , ( 2, False )
        , ( 3, False )
        ]
    }
        ! []



--
-- Update
--


type Msg
    = Toggle Int


toggleIfSelected : Int -> VisibilityElement -> VisibilityElement
toggleIfSelected id tuple =
    if id == fst tuple then
        ( id, not (snd tuple) )
    else
        tuple


update : Msg -> Model -> ( Model, Cmd a )
update msg model =
    case msg of
        Toggle id ->
            { model
                | visible = List.map (\e -> toggleIfSelected id e) model.visible
            }
                ! [ toggleAccordion (itemIdString id) ]



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


expandedClass : VisibilityElement -> String
expandedClass visibility =
    if snd visibility then
        "is-expanded"
    else
        "is-not-expended"


accordionItem : ( VisibilityElement, AccordionData Msg ) -> Html Msg
accordionItem visibiityTuple =
    let
        ( visibility, data ) =
            visibiityTuple
    in
        li []
            [ a
                [ id (itemIdString (fst visibility))
                , class (expandedClass visibility)
                , href "javascript:void(0)"
                , onClick (Toggle (fst visibility))
                ]
                [ text data.label ]
            , ul
                [ class "submenu" ]
                data.items
            ]


accordionList : List VisibilityElement -> List (AccordionData Msg) -> Html Msg
accordionList visibility data =
    let
        zippedData : List ( VisibilityElement, AccordionData Msg )
        zippedData =
            List.map2 (,) visibility data
    in
        ul [ class "accordion" ]
            (List.map accordionItem zippedData)


view : Model -> List (AccordionData Msg) -> Html Msg
view model data =
    div []
        [ ul [] (List.map (\e -> li [] [ text (toString (snd e)) ]) model.visible)
        , accordionList model.visible data
        ]
