-- [1, 1, 2, 3]
-- 1 : delRep (del 1 [1, 2, 3])
-- 1 : delRep [2, 3]

delRep [] = []
delRep (a : xs) = a : delRep (del a xs)

del _ [] = []
del n (a : xs) | n == a = del n xs | otherwise = a : del n xs 
