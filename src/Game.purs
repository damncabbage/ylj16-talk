module App.Game where

import Prelude
import Data.Array (reverse)
import Data.String (joinWith, split)

strReverse :: String -> String
strReverse x =
  (joinWith "" <<< reverse <<< split "") x

usingStrReverse :: String
usingStrReverse = strReverse "My String"
