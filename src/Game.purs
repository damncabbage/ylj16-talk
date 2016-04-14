module App.Game
  ( Hand(..)
  , Result(..)
  , winner
  ) where

import Prelude

data Hand   = Rock | Paper | Scissors
data Result = P1Won | P2Won | Draw

winner :: Hand -> Hand -> Result
winner h1 h2 = Draw









-- Unfortunate debugging boilerplate:
import Data.Generic (class Generic, gShow)

derive instance genHand :: Generic Hand
derive instance genResult :: Generic Result

instance showHand :: Show Hand where
  show = gShow
instance showResult :: Show Result where
  show = gShow
