module AccordionData exposing (..)

import Html exposing (..)


type alias AccordionData a =
    { label : String
    , items : List (Html a)
    }
