/*--------------------------------< Soma2LAc >--------------------------------*/

sum2lac(L1, L2, R) :- soma2lac(L1, L2, [], R).

soma2lac([], L, Lac, R) :- append(Lac, L, R).
soma2lac(L, [], Lac, R) :- append(Lac, L, R).
soma2lac([A | As], [B | Bs], Lac, R) :-
    S is A + B,
    append(Lac, [S], Lac2),
    soma2lac(As, Bs, Lac2, R).