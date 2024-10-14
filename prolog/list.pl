/*
This is a list in prolog: [1, 2, 3]

Head and tail notation, similar to haskell: [A|As]

A = 1
As = [2, 3]

É equivalente a:
[1, 2, 3] = [1 | [2, 3]] = [1 | [2 | [3 | []]]]
*/

/*
Progam to calculate the length of a list in haskell

tam [] = 0.
tam (a : xs) = 1 + tam xs
*/

tam([], 0).
tam([A | As], R) :- tam(As, R2), R is R2 + 1.

/*--------------------------------< SomaMult >--------------------------------*/

/*
sm([], 0, 0).
sm(L, S, M) :- sm(L, 0, 1, S, M).
*/

sm([], 0, 0).
sm(L, S, M) :- sm(L, 0, 1, S, M).

sm([], Sac, Mac, Sac, Mac).
sm([N | Ns], Sac, Mac, S, M) :- Sac2 is Sac + N, Mac2 is Mac * N, sm(Ns, Sac2, Mac2, S, M).