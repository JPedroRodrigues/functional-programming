s2l [] lst = lst
s2l lst [] = lst
s2l (a : xs) (b : ys) = a + b : s2l xs ys