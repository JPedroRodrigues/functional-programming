/*
Escreva em Prolog o predicado agrupa, que recebe um inteiro N e uma lista e agrupa os seus elementos, na sequência, em listas de tamanho N.

Exemplo de entrada do "agrupa".
agrupa(3, [1, 2, 3, 4, 5, 6, 7, 8], R).
R = [[ 1, 2, 3], [4, 5, 6], [7, 8]] 
*/

agrupa(_, [], []).
agrupa(N, Lst, R) :-
    agrupa(N, 0, Lst, [], R).

agrupa(_, _, [], Lac, [Lac]) :-
    Lac \= []. 

agrupa(N, N, Lst, Lac, [Lac | R]) :-
    agrupa(N, 0, Lst, [], R).

agrupa(N, C, [A | As], Lac, R) :-
    C2 is C + 1,
    append(Lac, [A], Lac2),
    agrupa(N, C2, As, Lac2, R).
