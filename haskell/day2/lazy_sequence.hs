module Main where

    seq_c c x =  [x, (x + c)..]

    seq_3 :: Integer -> [Integer]
    seq_3 = seq_c 3

    seq_5 :: Integer -> [Integer]
    seq_5 = seq_c 5

    seq_8 :: Integer -> [Integer]
    seq_8 x = zipWith (+) (seq_3 x) (seq_5 5)
