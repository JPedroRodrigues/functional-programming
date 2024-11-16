/*
Escreva em Prolog o programa enup, que recebe uma lista e um inteiro N e enuplica seus elementos, ou seja, repete cada elemento N vezes.

Exemplo de entrada do "enuplica".

enup([1, 2, 3], 2, R).
R = [1, 1, 2, 2, 3, 3]

enup([1, 2], 5, R).
R = [1, 1, 1, 1, 1, 2, 2, 2, 2, 2]
*/

enup([], _, []).
enup(Lst, N, R) :-
    enup(Lst, 0, N, R).

enup([], _, _, []).
enup([_ | As], N, N, R) :-
    enup(As, 0, N, R).
enup([A | As], C, N, [A | R]) :-
    C2 is C + 1,
    enup([A | As], C2, N, R).
