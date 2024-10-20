module Main where

import Control.Monad ( forever )
import Data.Char ( isDigit )
import Data.List ( partition )
import System.IO (BufferMode (NoBuffering), hSetBuffering, stdout)

data Token = Op Char | Num String deriving (Show)

tokenizeString :: String -> [Token]
tokenizeString s = map classify (words s)
  where
    classify s@(o : _) = if all isDigit s then Num s else Op o

part :: [Token] -> ([Token], [Token])
part = partition go
  where
    go (Num _) = True
    go (Op _) = False

solve :: [Token] -> [Token] -> [Token]
solve [a] [] = [a]
solve [] _ = error "Malformed expression"
solve (Num a : Num b : ns) (Op '+' : ops) = solve (Num (show ((read a :: Float) + read b)) : ns) ops
solve (Num a : Num b : ns) (Op '-' : ops) = solve (Num (show ((read a :: Float) - read b)) : ns) ops
solve (Num a : Num b : ns) (Op '*' : ops) = solve (Num (show ((read a :: Float) * read b)) : ns) ops
solve (Num a : Num b : ns) (Op '/' : ops) = solve (Num (show ((read a :: Float) / read b)) : ns) ops
solve (a : _) [] = error "Too many numbers"

main :: IO ()
main =
  putStrLn "Welcome to this arbitrary polish notation solver. Please enjoy your stay."
    >> putStrLn "Please input 1 expression per line"
    >> putStrLn "Press ctrl + C to exit"
    >> putStrLn "( ^_^)"
    >> go
  where
    go =
      forever $ do
        hSetBuffering stdout NoBuffering
        putStr "> "
        l <- getLine
        let tokens = (part . tokenizeString) l
        let (Num res : _) = uncurry solve tokens
        putStrLn res
