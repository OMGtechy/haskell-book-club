module Lib
    ( someFunc
    ) where

double :: Integer -> Integer
double x = x + x

someFunc :: IO ()
someFunc = do
    putStr "double 4: "
    print (double 4)
    putStr "double (double 4): "
    print (double (double 4))
