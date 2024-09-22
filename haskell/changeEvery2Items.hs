 -- Takes a list [1, 2, 3, 4, 5, 6]
 -- And changes every two elements in order to create the following list [2, 1, 4, 3, 6, 5]

--------------------------------------------------------------------
-- Change Every Two Elements
--------------------------------------------------------------------

tok2 :: [Integer] -> [Integer]
tok2 [] = []
tok2 [a] = [a]
tok2 (a : b : xs) = [b, a] ++ tok2 xs
