{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module Lib
    ( someFunc
    ) where

double :: Integer -> Integer
double x = x + x

{-# HLINT summm supersum #-}
summm :: [Integer] -> Integer
summm = foldr (+) 0

{-# HLINT ignore supersum #-}
supersum :: [Integer] -> Integer
supersum restoflist = foldr (+) 0 restoflist

superdupersum :: [Integer] -> Integer
superdupersum [] = 0
superdupersum (first:restoflist) = first + supersum restoflist

qsort :: Ord x => [x] -> [x]
qsort [] = []
qsort (x:xs) = qsort smol ++ [x] ++ qsort beeg
    where
        smol = [a | a <- xs, a <= x]
        beeg = [a | a <- xs, a > x]

someFunc :: IO ()
someFunc = do
    putStr "double 4: "
    print (double 4)
    putStr "double (double 4): "
    print (double (double 4))
    putStr "sum [1..5]: "
    print (sum [1..5 :: Integer])
    putStr "summm [1..5]: "
    print (summm [1..5])
    putStr "supersum [1..5]: "
    print (supersum [1..5])
    putStr "superdupersum [1..5]: "
    print  (superdupersum [1..5])
    putStr "qsort [1,5,2,67,23]: "
    print (qsort [1,5,2,67,23 :: Integer])
