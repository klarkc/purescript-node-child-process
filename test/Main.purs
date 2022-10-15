module Test.Main where

import Prelude (Unit)

import Effect (Effect)
import Control.Apply ((*>))
import Test.Node.ChildProcess as ChildProcess
import Test.Node.ChildProcess.Aff as ChildProcess.Aff

main :: Effect Unit
main = ChildProcess.test *> ChildProcess.Aff.test
