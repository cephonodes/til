module Main where
import Numeric
import Data.Char

main :: IO ()
main = do
  putStrLn "hello world"

myShowOct x = showOct x ""
myShowBin x = showIntAtBase 2 intToDigit x ""
generateDecList x = zip (map show [10..x]) (map reverse (map show [10..x]))
generateOctList x = zip (map myShowOct [10..x]) (map reverse (map myShowOct [10..x]))
generateBinList x = zip (map myShowBin [10..x]) (map reverse (map myShowBin [10..x]))
generateAllList x = zip3 (generateDecList x) (generateOctList x) (generateBinList x)
solveQ01 x = [(a, c, e) | ((a, b), (c,d), (e, f)) <- (generateAllList x), a == b, c == d, e == f]
