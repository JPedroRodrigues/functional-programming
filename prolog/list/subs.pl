/*
Escreva em Prolog o programa subs, que recebe dois elementos (a e b) e uma lista
lst, todos do mesmo tipo, e substitui todas as ocorrências de a por b em lst.

Exemplo de entrada do "substitui a por b na lista".

subs(1, 2, [4, 5, 1, 1, 3, 1], R).
R = [4, 5, 2, 2, 3, 2] 
*/

/* Case base */
subs(_, _, [], []).

/* Se o elemento for igual ao elemento buscado (a) */
subs(A, B, [A | Cs], [B | R]) :-
    subs(A, B, Cs, R).
/* Se o elemento for diferente do buscado (~a) */    
subs(A, B, [C | Cs], [C | R]) :-
    subs(A, B, Cs, R).
