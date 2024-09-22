data Tree = Node Integer Tree Tree | Leaf Integer
    deriving(Eq, Show)

tree1 :: Tree
tree1 = Node 12 
        (Node 8 (Leaf 6) (Leaf 10)) 
        (Node 16 (Leaf 14) (Leaf 18))

tree2 :: Tree
tree2 = Node 5
        (Node 10 (Leaf  5) (Leaf 10))
        (Node 5  (Leaf 10) (Leaf  5))

-----------------------------------------------------------------------
-- Sum leaves values
-----------------------------------------------------------------------

sumLeaves :: Tree -> Integer
sumLeaves (Leaf n) = n
sumLeaves (Node _ left right) = sumLeaves left + sumLeaves right

-----------------------------------------------------------------------
-- Sum Nodes except leaves
-----------------------------------------------------------------------

sumNotLeaves :: Tree -> Integer
sumNotLeaves (Leaf _) = 0
sumNotLeaves (Node n left right) = n + sumNotLeaves left + sumNotLeaves right

-----------------------------------------------------------------------
-- Sum All Nodes
-----------------------------------------------------------------------

sumNodes :: Tree -> Integer
sumNodes (Leaf n) = n
sumNodes (Node n left right) = n + sumNodes left + sumNodes right

-----------------------------------------------------------------------
-- Pre-order traversal
-----------------------------------------------------------------------

preOrder :: Tree -> [Integer]
preOrder (Leaf n) = [n]
preOrder (Node n left right) = [n] ++ preOrder left ++ preOrder right

-----------------------------------------------------------------------
-- In-order traversal
-----------------------------------------------------------------------

inOrder :: Tree -> [Integer]
inOrder (Leaf n) = [n]
inOrder (Node n left right) = inOrder left ++ [n] ++ inOrder right

-----------------------------------------------------------------------
-- Post-order traversal
-----------------------------------------------------------------------

postOrder :: Tree -> [Integer]
postOrder (Leaf n) = [n]
postOrder (Node n left right) = postOrder left ++ postOrder right ++ [n]

-----------------------------------------------------------------------
-- Tree Height
-----------------------------------------------------------------------

height :: Tree -> Integer
height (Leaf _) = 0
height (Node n left right) = 1 + greaterHeight (height left) (height right)

greaterHeight :: Integer -> Integer -> Integer
greaterHeight heightA heightB | heightA > heightB = heightA | otherwise = heightB

-----------------------------------------------------------------------
-- Update a Node Value
-----------------------------------------------------------------------

updateTree :: Integer -> Integer -> Tree -> Tree
updateTree a b (Leaf n) | a == n = Leaf b | otherwise = Leaf n
updateTree a b (Node n left right) 
    | a == n = Node b (updateTree a b left) (updateTree a b right) 
    | otherwise = Node n (updateTree a b left) (updateTree a b right)