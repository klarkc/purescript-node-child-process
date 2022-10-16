module Test.Node.ChildProcess.Aff (test) where

import Prelude (($), Unit, discard, bind)
import Data.Functor ((<$>))
import Control.Bind ((=<<))
import Data.Tuple (fst)
import Effect.Aff (Aff)
import Effect.Console (log)
import Effect.Class (liftEffect)
import Node.ChildProcess (stdout, defaultSpawnOptions)
import Node.ChildProcess.Aff (spawn)
import Node.Buffer (toString, concat)
import Node.Stream.Aff (readAll)
import Node.Encoding (Encoding (UTF8))

test :: Aff Unit
test = do
  liftEffect $ log "running Test.Node.ChildProcess.Aff test"
  spawnLs

spawnLs :: Aff Unit
spawnLs = do
  liftEffect $ log "spawns processes ok"
  ls <- spawn "ls" ["-la"] defaultSpawnOptions
  xs <- fst <$> (readAll $ stdout ls)
  output <- liftEffect $ concat xs
  liftEffect $ log =<< toString UTF8 output
