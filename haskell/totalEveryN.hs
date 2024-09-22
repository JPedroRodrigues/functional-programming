-- Input sample: 5 [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
-- Output expected: [5, 5, 2]

totK _ [] = []
totK k (a : xs) = total k 0 0 (a : xs)

total _ _ totalSum [] = [totalSum]
total k cnt totalSum (a : xs)
    | k == cnt = totalSum : total k 0 0 (a : xs)
    | otherwise = total k (cnt + 1) (totalSum + a) xs
