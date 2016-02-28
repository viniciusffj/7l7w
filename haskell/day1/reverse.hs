module Main where
    reverse_list :: [a] -> [a]
    reverse_list [] = []
    reverse_list (h:t) = reverse_list t ++ [h]
