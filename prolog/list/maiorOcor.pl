/*
Escreva em Prolog o predicado maiorOcor que recebe uma lista L e responde E, que é o elemento que mais ocorre em L. Suponha que L nunca é vazia.

Exemplo de entrada do "maiorOcor".

maiorOcor([2, 1, 1, 4, 2, 2, 2, 5], R).
R = 2
*/

/* QUICK SORT */
/* Partition - partit(L, P, L1, L2) */
part([], _, [], []).
part([A | As], P, [A | Xs], L2) :-
    A =< P,
    part(As, P, Xs, L2).
part([A | As], P, L1, [A | Ys]) :-
    part(As, P, L1, Ys).

/* Quick Sort - qs(L, R) */
qs([], []).
qs([A], [A]).
qs([P | L], R) :-
    part(L, P, Lmenor, Lmaior),
    qs(Lmenor, Rmenor),
    qs(Lmaior, Rmaior),
    append(Rmenor, [P | Rmaior], R).

/* Maior Ocorrência de Um Número */
maiorOcor(L, R) :- 
    qs(L, Lordernada),
    freq(Lordernada, 0, 0, _, R).

freq([], _, _, N, N).

freq([A, A | As], Freq, FreqMax, N, R) :-
    Freq2 is Freq + 1,
    freq([A | As], Freq2, FreqMax, N, R).

freq([A, B | As], Freq, FreqMax, _, R) :-
    A \= B,
    Freq2 is Freq + 1,
    Freq2 > FreqMax,
    freq([B | As], 0, Freq2, A, R).

freq([A, B | As], Freq, FreqMax, N, R) :-
    A \= B,
    Freq2 is Freq + 1,
    Freq2 =< FreqMax,
    freq([B | As], 0, FreqMax, N, R).

freq([A], Freq, FreqMax, _, [A]) :-
    Freq1 is Freq + 1,
    Freq1 >= FreqMax.
    
freq([_], _, _, N, N).
