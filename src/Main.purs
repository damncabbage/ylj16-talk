module Main where

import Prelude
import App.Routes as Routes
import App.Layout (Action(PageView), State, view, update)
import Control.Monad.Eff (Eff)
import Debug.Trace (traceAny)
import DOM (DOM)
import Pux (App, CoreEffects, fromSimple, start, renderToDOM)
import Pux.Router (sampleUrl)
import Signal ((~>))

type AppEffects = (dom :: DOM)

-- | Entry point for the browser.
main :: State -> Eff (CoreEffects AppEffects) (App State Action)
main state = do
  -- | Create a signal of URL changes.
  urlSignal <- sampleUrl

  -- | Map a signal of URL changes to PageView actions.
  let routeSignal = urlSignal ~> \r -> PageView (Routes.match r)

  app <- start
    { initialState: state
    , update:
        -- | Logs all actions and states (removed in production builds).
        (\a s -> traceAny {action: a, state: s} (\_ -> (fromSimple update) a s))
    , view: view
    , inputs: [routeSignal] }

  renderToDOM "#app" app.html

  -- | Used by hot-reloading code in src/js/index.js
  pure app
