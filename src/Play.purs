module App.Play where

import App.Game (Hand)
import Data.Maybe (Maybe(..))
import Pux.Html (button, text, div, Html)
import Pux.Html.Attributes (className)
import Pux.Html.Events (onClick)
import Prelude hiding (div)

type State = { score :: Int }

init :: State
init = { score: 0 }

data Action = Win
            | ResetGame

update :: Action -> State -> State
update Win state = state { score = state.score + 1 }
update ResetGame state = init

view :: State -> Html Action
view state =
  div [ className "game" ]
    [ button [ onClick (\_ -> Win) ]
             [ text (show state.score) ]
    , button [ onClick (\_ -> ResetGame) ]
             [ text "Reset" ]
    ]
