module Main where

import Task exposing (Task,andThen,onError,succeed)
import Console
import File
import Process
import String
import List exposing (map)

port main : Task x ()
port main =
  Process.exec "brew list --versions"
           `andThen` (\n-> succeed(map splitWords
                                       (splitLines n)))
           `andThen` Console.log
           `onError` Console.log

splitLines : String -> List String
splitLines s = String.split "\n" s

splitWords : String -> List String
splitWords s = String.split " " s
