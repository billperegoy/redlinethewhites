module Accordion exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)

import AccordionData exposing (..)


accordionSubItem : List (Html a) -> Html a
accordionSubItem content =
  li []
    [
      a [href "javascript:void(0)" ] content
    ]

accordionItem : AccordionData a -> Html a
accordionItem data =
  li []
    [
      a
        [ href "javascript:void(0)", class "js-accordion-trigger" ]
        [ text data.label ]
    , ul
        [ class "submenu" ]
        data.items
    ]

view : List (AccordionData a) -> Html a
view data =
  ul [ class "accordion" ]
  (List.map (\e -> accordionItem e) data)
