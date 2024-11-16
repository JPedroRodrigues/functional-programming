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