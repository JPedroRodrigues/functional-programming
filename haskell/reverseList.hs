-- Reverse a list [1, 2, 3, 4, 5]
-- Into a [5, 4, 3, 2, 1]

rev [] = []
rev (a : xs) = rev xs ++ [a]