module Main where
    import Data.List.Split
    import Data.Char

    right_str_to_n :: [Char] -> Double
    right_str_to_n = sum . map (\(i,x) -> x / 10^i) . zip [1..] . map (fromIntegral . digitToInt) . last . splitOn "." 

    left_str_to_n :: [Char] -> Double
    left_str_to_n = fromIntegral . sum . map (\(i,x) -> x * 10^i) . zip [0..] . reverse . map (fromIntegral . digitToInt) . foldl (++) "" . filter (/="") . splitOneOf "$," . head . splitOn "." 

    str_to_n :: [Char] -> Double
    str_to_n str = right_str_to_n str + left_str_to_n str
