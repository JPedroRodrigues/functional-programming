--------------------------------------------------------------------
-- Deletes Every K Elements
--------------------------------------------------------------------

delk :: Integer -> String -> String 
delk _ [] = []
delk k word = deleteK k 1 word

deleteK :: Integer -> Integer -> String -> String
deleteK _ _ [] = []
deleteK k cnt (a : xs) | k == cnt = deleteK k 1 xs | otherwise = a : deleteK k (cnt + 1) xs
