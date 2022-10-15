module Test.Node.ChildProcess.Aff (test) where

import Prelude (Unit)
import Effect (Effect)
import Effect.Console (log)

test :: Effect Unit
test = log "running Node.ChildProcess test"
