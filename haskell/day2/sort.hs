module Main where
    -- insertion sort implementation
    import Data.List

    insertion_sort [] = []
    insertion_sort (h:t) = insertSort (<) h (insertion_sort t)

    insertion_sort_with f [] = []
    insertion_sort_with f (h:t) = insertSort f h (insertion_sort_with f t)

    insertSort f x l = case position f x l of
                        Just n -> insertAt x n l
                        Nothing -> l ++ [x] 

    position f n l = findIndex (f n) l

    insertAt x n l = let (l1, l2)  = splitAt n l
                        in  l1 ++ x:l2

