module Main where

main :: IO ()
main = do
  let answer1 = cutStick 20 1 3 0
  let answer2 = cutStick 100 1 5 0
  putStrLn "棒を1cmに切り分ける"
  putStrLn ("棒の長さ20cm, 人が3人のときの回数: " ++ (show answer1))
  putStrLn ("棒の長さ100cm, 人が5人のときの回数: " ++ (show answer2))

cutStick :: Int -> Int -> Int -> Int -> Int
cutStick stickLength stickNum peopleNum cutCount
  | stickNum >= stickLength = cutCount
  | stickNum < peopleNum = cutStick stickLength (stickNum * 2) peopleNum (cutCount + 1)
  | otherwise = cutStick stickLength (stickNum + peopleNum) peopleNum (cutCount + 1)