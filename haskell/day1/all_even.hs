module Main where
    -- Implementing using if
    allEven_if :: [Integer] -> [Integer]
    allEven_if [] = []
    allEven_if (h:t) = if even h then h:allEven_if t else allEven_if t

    -- Implementing using list comprehension
    allEven_comp :: [Integer] -> [Integer]
    allEven_comp list = [x | x <- list, even x]

    -- Implementing using filter
    allEven_filter :: [Integer] -> [Integer]
    allEven_filter = filter even
