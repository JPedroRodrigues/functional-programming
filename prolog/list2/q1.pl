/* 
Questão 1

Escreva em Prolog uma lista que recebe uma lista de inteiros com repetições
e deleta os elementos duplicados em sequência

del_dup([5, 5, 2, 1, 2, 2, 3, 3, 3], R).
> R = [5, 2, 1, 2, 3]
*/


del_dup([], []).
del_dup([A], [A]).
del_dup([A, A | Xs], R) :-
    del_dup([A | Xs], R).
del_dup([A, B | Xs], [A | R]) :-
    del_dup([B | Xs], R).