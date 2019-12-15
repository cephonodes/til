module Main where
import Language.Haskell.Interpreter
import Data.List

main :: IO ()
main = do
  putStrLn "hello world"

-- 数字の各桁の間に演算子を入れる
test1 :: [Char] -> [[Char]] -> [Char]
test1 [x] ys = [x]
test1 xs ys = (++) (take 1 xs) (head ys) ++ (test1 (tail xs) (tail ys))

test2 x = runInterpreter $ setImports ["Prelude"] >> eval x

test3 = map show [1000..9999]
test4 = ["+", "-", "*", "/", ""]  -- この中から3つを選んで順列を作るのを全パターンについてやりたい