module Main where

    hash_lookup k [] = Nothing
    hash_lookup k ((key, value):tail) 
        | k == key = Just value
        | otherwise = hash_lookup k tail
