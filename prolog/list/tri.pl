/*
Escreva em Prolog o programa tri, que recebe uma lista e triplica seus elementos:
Exemplo de entrada do "triplica".
tri([1, 2, 3], R).
R = [1, 1, 1, 2, 2, 2, 3, 3, 3]
*/

/* Caso base */
tri([], []).

/* Percurso cabeça cauda */
/* Definição da resposta */
tri([A | As], [A, A, A | R]) :-
    tri(As, R).
