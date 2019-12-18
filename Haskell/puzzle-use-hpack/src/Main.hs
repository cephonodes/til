module Main where
import Language.Haskell.Interpreter
import Data.List
import Control.Monad

main :: IO ()
main = do
  putStrLn "hello world"

-- 数字の各桁の間に演算子を入れる
test1 :: [Char] -> [[Char]] -> [Char]
test1 [x] ys = [x]
test1 xs ys = (++) (take 1 xs) (head ys) ++ (test1 (tail xs) (tail ys))

test2 x = runInterpreter $ setImports ["Prelude"] >> eval x

test3 = map show [1000..9999]
test4 = ["+", "-", "*", "/", ""]
test5 = replicateM 3 test4

test6 :: [Char] -> [[[Char]]] -> [[Char]]
test6 x [] = []
test6 x ys = test1 x (head ys) : (test6 x (tail ys))

test7 :: [[Char]] -> [[[Char]]] -> [[[Char]]]
test7 [] ys = []
test7 xs ys = test6 (head xs) ys : (test7 (tail xs) ys)
