/*
Questão 3: Escreva em Prolog um predicado subTree que substitui em uma árvore
todos os nós maiores que 5 por 6 e todas as folhas menores que 10 por 9. Os nós
e folhas restantes ficam intocados.

subT
*/

tree(node(10, node(7, leaf(2), leaf(3)), node(1, leaf(10), leaf(100)))).

subTree(leaf(N), leaf(9)) :-
    N < 10.
subTree(leaf(N), leaf(N)).
subTree(node(N, Ln, Rn), node(6, Ln2, Rn2)) :-
    N > 5,
    subTree(Ln, Ln2),
    subTree(Rn, Rn2).
subTree(node(N, Ln, Rn), node(N, Ln2, Rn2)) :-
    subTree(Ln, Ln2),
    subTree(Rn, Rn2).