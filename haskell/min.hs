findMin [] = -1
findMin [a] = a
findMin (a : xs) = isMinimal a xs

isMinimal n [] = n
isMinimal n (a : xs)
    | a < n = isMinimal a xs
    | otherwise = isMinimal n xs