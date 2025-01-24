/* Merge */
mergeL([], L, L).
mergeL(L, [], L).
mergeL([A | As], [B | Bs], [A | Xs]) :-
    A =< B,
    mergeL(As, [B | Bs], Xs).
mergeL([A | As], [B | Bs], [B | Xs]) :-
    mergeL([A | As], Bs, Xs).

/* Split */
splitL([], [], []).
splitL([A], [A], []).
splitL([A, B | Xs], [A | As], [B | Bs]) :-
    splitL(X, As, Bs).

/* Merge Sort */
ms([], []).
ms([A], [A]).
ms(L, R) :-
    splitL(L, L1, L2),
    ms(L1, R1),
    ms(L2, R2),
    mergeL(R1, R2, R).
