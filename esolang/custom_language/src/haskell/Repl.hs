module Main where

import Parser

import Control.Monad.Trans
import System.Console.Haskeline

process :: String -> IO ()
process line = do
  let res = parseToplevel line
  case res of
    Left err -> print err
    Right ex -> mapM_ print ex

main :: IO ()
main = runInputT defaultSettings loop
  where
  loop = do
    minput <- getInputLine "λ ⇒ "
    case minput of
      Nothing -> outputStrLn "Godspeed."
      Just input -> (liftIO $ process input) >> loop
