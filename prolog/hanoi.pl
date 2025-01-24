hanoi(1, E, C, D) :- 
    write("Mova um disco de "), 
    write(E), 
    write(" para "), 
    writeln(C).

hanoi(N, E, C, D) :-
    N2 is N - 1,
    hanoi(N2, E, D, C),
    hanoi(1, E, C, D),
    hanoi(N2, D, C, E).
