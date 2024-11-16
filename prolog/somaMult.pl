/*--------------------------------< SomaMult >--------------------------------*/

sm([], 0, 0).
sm(L, S, M) :- sm(L, 0, 1, S, M).

sm([], Sac, Mac, Sac, Mac).
sm([N | Ns], Sac, Mac, S, M) :- Sac2 is Sac + N, Mac2 is Mac * N, sm(Ns, Sac2, Mac2, S, M).