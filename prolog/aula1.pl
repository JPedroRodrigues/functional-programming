casa(azul).
casa(amarela).

% Você não pode dizer que N é N - 1
% Você precisa dizer que N2 é N - 1, criar um novo predicado
% Não existe atribuição no Prolog

fat(0, 1).
fat(N, R) :- N2 is N - 1, fat(N2, R2), R is R2 * N.