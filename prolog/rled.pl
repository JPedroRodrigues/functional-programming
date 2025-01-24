/* Run Length Encoding Decompressing */

rled([], []).
rled([(E, N) | Xs], R) :-
    repeating(E, N, L),
    rled(Xs, R2),
    append(L, R2, R).

repeating(_, 0, []).
repeating(E, N, [E | Xs]) :-
    N2 is N - 1,
    repeating(E, N2, Xs).
