import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)

import AccordionData exposing (..)
import Accordion exposing (..)

--
-- App
--
main : Program Never
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
  {
    data : List AccordionData
  }

type alias AccordionData =
  {
    label : String
  , items : List (Html Msg)
  }

--
-- Init
--
init : (Model, Cmd Msg)
init =
  {
    data = 
      [ 
        AccordionData "Accordion Item 1" 
          [
            accordionSubItem [ text "Sub Item 1" ]
          , accordionSubItem [ text "Sub Item 2" ]
          , accordionSubItem [ text "Sub Item 3" ]
          ]
      , AccordionData "Accordion Item 2" 
          [
            accordionSubItem [ text "Sub Item 4" ]
          , accordionSubItem [ text "Sub Item 5" ]
          , accordionSubItem [ text "Sub Item 6" ]
          ]
      , AccordionData "Accordion Item 3" 
          [
            accordionSubItem [ text "Sub Item 7" ]
          , accordionSubItem [ text "Sub Item 8" ]
          , accordionSubItem [ text "Sub Item 9" ]
          ]
      ]
  } ! []


--
-- Update
--
type Msg
  = NoOp

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      model ! []

--
-- View
--
view : Model -> Html Msg
view model =
  Accordion.view model.data

--
-- Subscriptions
--
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
