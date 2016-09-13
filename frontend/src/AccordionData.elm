module AccordionData exposing (..)

import Html exposing (..)


type alias AccordionData a =
    { label : String
    , id : Int
    , items : List (Html a)
    }
