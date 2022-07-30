{-# LANGUAGE LambdaCase #-}

module Main where

import Control.Monad.Reader
import GHC.IO.Encoding
import Resume
import System.Environment
import TeX (Mode (..))

main :: IO ()
main =
  getArgs >>= \case
    ["zh"] -> f Chinese
    ["en"] -> f English
    ["elab"] -> f Elaborated
    _ ->
      putStrLn $
        unlines
          [ "Usage: <program> MODE",
            "MODE can be zh, en or elab"
          ]
  where
    f x = do
      setLocaleEncoding utf8
      putStrLn $ runReader resume x
