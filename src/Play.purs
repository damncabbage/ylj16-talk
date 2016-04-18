module App.Play where

import Prelude hiding (div)
import Pux.Html (text, div, Html)
import Pux.Html.Attributes (className)

type State = { }

init :: State
init = { }

data Action = Todo

update :: Action -> State -> State
update action state = state

view :: State -> Html Action
view state =
  div [ className "game" ] [ text "Hello" ]
