/* Run Length Encoding - Compressing */
rlec([], []).
rlec([E | Es], R) :-
    rlec(Es, E, 1, [], R).

rlec([], E, N, Lac, R) :- append(Lac, [(E, N)], R).
rlec([E | Es], E, N, Lac, R) :- 
    N2 is N + 1,
    rlec(Es, E, N2, Lac, R).
rlec([A | As], E, N, Lac, R) :-
    append(Lac, [(E, N)], Lac2),
    rlec(As, A, 1, Lac2, R).
