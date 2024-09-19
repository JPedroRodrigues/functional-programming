-- tot3 [1, 1, 1, 2, 2, 2, 3, 3, 3, 4]
-- returns: [3, 6, 9, 4]

tot3 [] = []
tot3 [a] = a
tot3 [a, b] = a + b
tot3 a : b : c : xs = a + b + c