/*
          5
        /  \
       7    3
      / \   / \
     4   2 1   9
    / \
   6   8

*/

tree(node(5, node(7, node(4, leaf(6), leaf(8)), leaf(2)), node(3, leaf(1), leaf(9)))).

/* Tree Sum */
sumT(leaf(N), N).
sumT(node(N, Tl, Tr), R) :-
    sumT(Tl, Rl),
    sumT(Tr, Rr),
    R is N + Rl + Rr.

