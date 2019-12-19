module Main where

main :: IO ()
main = do
  let answer = solveQ03 cards 2
  print answer

cards = zip [1..100] (replicate 100 False)

-- Integralは整数のみを含む型クラス。
-- mod関数が取れる引数がIntegral型クラスなので、flipCards関数が取る引数もIntegral型クラスでなければならない。

flipCards :: Integral a => [(a, Bool)] -> a -> [(a, Bool)]
flipCards [] _          = []
flipCards (x:xs) n
  | mod (fst x) n == 0  = (fst x, not (snd x)) : flipCards xs n
  | otherwise           = (fst x, snd x) : flipCards xs n

pickFaceDownCards :: [(a, Bool)] -> [a]
pickFaceDownCards []    = []
pickFaceDownCards (x:xs)
  | (snd x) == False  = fst x : pickFaceDownCards xs
  | otherwise         = pickFaceDownCards xs

solveQ03 :: Integral a => [(a, Bool)] -> a -> [a]
solveQ03 xs n
  | firstState == secondState   = pickFaceDownCards firstState
  | otherwise                   = solveQ03 secondState (n + 2)
  where firstState = flipCards xs n
        secondState = flipCards firstState (n + 1)
