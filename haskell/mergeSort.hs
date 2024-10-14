--------------------------------------------------------------------
-- Merge
--------------------------------------------------------------------

merge list1 [] = list1
merge [] list2 = list2
merge (a : xs) (b : ys) 
    | a <= b = a : merge xs (b : ys) 
    | otherwise = b : merge (a : xs) ys

--------------------------------------------------------------------
-- Split
--------------------------------------------------------------------

-- split :: [Integer] -> ([Integer], [Integer])
split [] = ([], [])
split [a] = ([a], [])
split lst = splitList lst [] []

-- splitList :: [Integer] -> [Integer] -> [Integer] -> ([Integer], [Integer]) 
splitList [] auxList1 auxList2 = (auxList1, auxList2)
splitList [a] auxList1 auxList2 = (auxList1 ++ [a], auxList2)
splitList (a : b : xs) auxList1 auxList2 = splitList xs (auxList1 ++ [a]) (auxList2 ++ [b])

--------------------------------------------------------------------
-- Merge Sort
--------------------------------------------------------------------

frst (lst1, _) = lst1
scnd (_, lst2) = lst2

mergeSort [] = []
mergeSort [a] = [a]
mergeSort lst = merge (mergeSort lst1) (mergeSort lst2)
    where (lst1, lst2) = split lst 