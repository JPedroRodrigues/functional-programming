/*
--------------------------------------------------------------------------------
-- Paradigmas de Linguagem de Programação
-- Prof: Antonio Luiz Basile
-- Nome: João Pedro Rodrigues Vieira
-- Nome: Sabrina Midori F. T. de Carvalho
-- RA: 10403595
-- RA: 10410220
-- Turma: 05G
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
                             Huffman Algorithm
--------------------------------------------------------------------------------
-- Huffman Tree Algorithm
-- 1: Create Leaves containing each a character and its frequency in text
-- 2: Place those leaves inside a priority queue
-- 3: Order the queue and take the two least frequent characters (two first)
-- 4: Create a Node containing the sum of the two selected carachters'
-- frequencies
-- 5: Add the recently created node to the queue
-- 6: Repeat the process starting from step 3 until there's only one element 
-- in the queue

-- Encoding
-- 1: Traverse the Huffman Tree, appending "0" when you go towards the left
-- node and "1" otherwise
-- 2: Reaching a Leaf, return a tuple with the char and its resulting encoding
-- 3: Take the original text and, for each character, find its corresponding
-- encoding and append it in a single string

--------------------------------------------------------------------------------
                                   Main
--------------------------------------------------------------------------------
*/

huffman(InputFile, R) :-
    read_file(InputFile, Contents),
    atom_chars(Contents, CharList),
    char_frequency(CharList, PriorityQueue),
    qs(PriorityQueue, OrderedPriorityQueue),
    create_huffman_tree(OrderedPriorityQueue, HuffmanTree),
    encode_huffman_tree(HuffmanTree, EncodedTree),
    generate_encoded_text(CharList, EncodedTree, R),
    write_file(R).

/*
|-------------------------------------------------------------------------------
| * Predicates to read and write in a file
|-------------------------------------------------------------------------------
*/

read_file(File, Contents) :-
    open(File, read, Stream),
    read_string(Stream, _, Contents),
    close(Stream).

write_file(Text) :-
    open('out.txt', write, Stream),  
    write(Stream, Text),
    nl(Stream),                         
    close(Stream).              

/*
|-------------------------------------------------------------------------------
| * Predicates to create a priority Queue
|-------------------------------------------------------------------------------
*/

char_frequency([], []).
char_frequency(CharList, R) :-
    get_frequency(CharList, [], R).

get_frequency([], FreqList, FreqList).
get_frequency([A | As], FreqList, R) :-
    check_freq(A, FreqList, FreqList2),
    get_frequency(As, FreqList2, R).

check_freq(A, [], [leaf(A, 1)]).
check_freq(A, [leaf(A, F) | As], [leaf(A, F2) | As]) :-
    F2 is F + 1.
check_freq(A, [leaf(C, F) | As], [leaf(C, F) | R]) :-
    check_freq(A, As, R).

/*
|-------------------------------------------------------------------------------
| * Predicates to create a Huffman Tree
|-------------------------------------------------------------------------------
*/

create_huffman_tree([], []).
create_huffman_tree([A], A).
create_huffman_tree([A, B | Xs], R) :-
    freq(A, FreqA),
    freq(B, FreqB),
    FreqSum is FreqA + FreqB,
    append(Xs, [node(FreqSum, A, B)], FreqList),
    qs(FreqList, OrderedQueue),
    create_huffman_tree(OrderedQueue, R).

/*
|-------------------------------------------------------------------------------
| * Predicates to get the encoding base on the Huffman Tree
|-------------------------------------------------------------------------------
*/

encode_huffman_tree(Tree, R) :- encode_huffman_tree(Tree, [], R).
encode_huffman_tree(leaf(C, _), Encoding, [(C, EncodedMessage)]) :-
    atomic_list_concat(Encoding, '', EncodedMessage).
encode_huffman_tree(node(_, Left, Right), Encoding, R) :-
    append(Encoding, [0], LeftEncoding),
    encode_huffman_tree(Left, LeftEncoding, LeftEncodingResult),
    append(Encoding, [1], RightEncoding),
    encode_huffman_tree(Right, RightEncoding, RightEncodingResult),
    append(LeftEncodingResult, RightEncodingResult, R).

generate_encoded_text([], _, "").
generate_encoded_text([Char | CharList], Encoding, R) :-
    get_encoding(Char, Encoding, CharEncoding),
    generate_encoded_text(CharList, Encoding, NextEncoding),
    string_concat(CharEncoding, NextEncoding, R).

get_encoding(_, [], "").
get_encoding(Char, [(Char, Encoding) | _], Encoding).
get_encoding(Char, [(_, _) | Xs], R) :-
    get_encoding(Char, Xs, R).

/*
|-------------------------------------------------------------------------------
| * Quick Sort
|-------------------------------------------------------------------------------
*/

/* Get the frequency from a node/leaf */
freq(leaf(_, F), F).
freq(node(F, _, _), F).

/* Partition */
part([], _, [], []).
part([A | As], P, [A | Xs], L2) :-
    freq(A, FreqA),
    freq(P, FreqP),
    FreqA =< FreqP,
    part(As, P, Xs, L2).
part([A | As], P, L1, [A | Ys]) :-
    part(As, P, L1, Ys).

/* Quick Sort */
qs([], []).
qs([A], [A]).
qs([P | L], R) :-
    part(L, P, Lmenor, Lmaior),
    qs(Lmenor, Rmenor),
    qs(Lmaior, Rmaior),
    append(Rmenor, [P | Rmaior], R).
