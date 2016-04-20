module App.Game
  ( Hand(..)
  , Result(..)
  , PlayerPair
  , Round
  , playerPair
  , winner
  , rockAI
  , randomAI
  ) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Random (randomInt, RANDOM)

data Hand   = Rock  | Paper | Scissors
data Result = P1Won | P2Won | Draw
derive instance eqHand   :: Eq Hand   -- Makes Hand and Result
derive instance eqResult :: Eq Result -- comparable with ==

type PlayerPair a = { p1 :: a, p2 :: a }
type Round        = PlayerPair Hand

winner :: Hand -> Hand -> Result
winner h1 h2 = case h1, h2 of
  Rock, Rock         -> Draw
  Rock, Paper        -> P2Won
  Rock, Scissors     -> P1Won
  Paper, Rock        -> P1Won
  Paper, Paper       -> Draw
  Paper, Scissors    -> P2Won
  Scissors, Rock     -> P2Won
  Scissors, Paper    -> P1Won
  Scissors, Scissors -> Draw

----- Misc Helpers -----

-- | A quick helper for a common P1 + P2 structure
playerPair :: forall a. a -> a -> PlayerPair a
playerPair a b = { p1: a, p2: b }


----- AI -----

rockAI :: Hand
rockAI = Rock -- Dumb as a bag of.

randomAI :: forall eff. Eff (random :: RANDOM | eff) Hand
randomAI = do
  n <- randomInt 1 3
  pure $ case n of
    1 -> Rock
    2 -> Paper
    _ -> Scissors



----- Unfortunate debugging boilerplate: -----
import Data.Generic (class Generic, gShow)

derive instance genHand :: Generic Hand
derive instance genResult :: Generic Result

instance showHand :: Show Hand where
  show = gShow
instance showResult :: Show Result where
  show = gShow
