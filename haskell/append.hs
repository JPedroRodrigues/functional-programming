-- Append a number in a list
-- append 5 [1, 2, 3, 4]
-- 1 : append 5 [2, 3, 4]
-- 2 : append 5 [3, 4]
-- 3: append 5 [4]
-- 4 : append 5 []
-- [5]
-- [4, 5]
-- ...
-- [1, 2, 3, 4, 5]

append n [] = [n]
append n (a : xs) = a : append n xs