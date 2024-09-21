-- Calculates fib sequence
fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

-- Calculates a factorial of a given number
fat 0 = 1
fat n = n * fat (n - 1)

-- Make an append damn
appnd n [] = [n]
appnd n (a : xs) = a : appnd n xs 

-- Find dat damn number
find _ [] = -1
find n (a : xs) | n == a = 0 | otherwise = findIdx n 1 xs

findIdx _ idx [] = -1
findIdx n idx (a : xs) | n == a = idx | otherwise = findIdx n (idx + 1) xs

intersec [] lst = []
intersec lst [] = []
intersec (a : xs) lst 
    | findNumber a lst = a : intersec xs lst 
    | otherwise = intersec xs lst

findNumber n [] = False
findNumber n (b : ys) 
    | n == b = True 
    | otherwise = findNumber n ys

s2l lst [] = lst
s2l [] lst = lst
s2l (a : xs) (b : ys) = a + b : s2l xs ys