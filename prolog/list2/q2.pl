/* 
Questão 2: Escreva em Prolog o predicado tot3, que recebe uma lista e totaliza
a cada 3 elementos da lista

tot3([1, 1, 1, 2, 5, 0, 3, 3, 3, 4], R).
> R = [3, 7, 9, 4]
*/

tot3([], []).
tot3([N], [N]).
tot3([A, B], [R]) :- R is A + B.
tot3([A, B, C | Xs], [S | R]) :- 
    S is A + B + C,
    tot3(Xs, R).

/*
tot3([], []).
tot3([N], [N]).
tot3(L, R) :- tot3(L, 0, 0, R).

tot3([], S, _, [S]).
tot3([A | Xs], S, Q, R) :-
    Q < 3,
    S2 is S + A,
    Q2 is Q + 1,
    tot3(Xs, S2, Q2, R).
tot3(L, S, Q, [S | R]) :-
    tot3(L, 0, 0, R).
*/