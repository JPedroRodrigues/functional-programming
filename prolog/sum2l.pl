/*---------------------------------< Soma2L >---------------------------------*/

sum2l([], L, L).
sum2l(L, [], L).
sum2l([A | As], [B | Bs], [R | Rs]) :- R is A + B, sum2l(As, Bs, Rs).