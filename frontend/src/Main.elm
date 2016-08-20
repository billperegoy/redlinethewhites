import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)

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
    foo : String
  }

--
-- Init
--
init : (Model, Cmd Msg)
init =
  {
    foo = "foo"
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

accordionSubItem : List (Html a) -> Html a
accordionSubItem content = 
        li []
          [ 
            a [href "javascript:void(0)" ] content
          ]

subItemList : List (Html a)
subItemList =
       [
         accordionSubItem [ text "Sub Item 1" ]
       , accordionSubItem [ text "Sub Item 2" ]
       , accordionSubItem [ text "Sub Item 3" ]
       ]

accordionItem : String -> List (Html Msg) -> Html a
accordionItem name subItems=
  li []
    [
      a 
        [ href "javascript:void(0)", class "js-accordion-trigger" ]
        [ text name ]
    , ul 
        [ class "submenu" ]
        subItemList
    ]

accordion : Html Msg
accordion = 
  ul [ class "accordion" ]
    [
      accordionItem "Accordion Item 1" subItemList
    , accordionItem "Accordion Item 2" subItemList
    , accordionItem "Accordion Item 3" subItemList
    ]

--
-- View
--
view : Model -> Html Msg
view model =
  accordion

--
-- Subscriptions
--
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
