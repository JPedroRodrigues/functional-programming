% Huffman Tree Data Representation
% Leaf: leaf(Char, Freq)
% Node: node(Freq, LeftTree, RightTree)

% Main Logic: Simulate the main function
huffman_main(InputFile, OutputFile) :-
    read_file(InputFile, Contents),
    char_frequency(Contents, PriorityQueue),
    merge_sort(PriorityQueue, OrderedQueue),
    create_huffman_tree(OrderedQueue, HuffmanTree),
    encode_huffman_tree(HuffmanTree, Encoding),
    generate_encoded_text(Contents, Encoding, EncodedText),
    write_file(OutputFile, EncodedText).

% Read file contents
read_file(File, Contents) :-
    open(File, read, Stream),
    read_string(Stream, _, Contents),
    close(Stream).

% Write encoded text to file
write_file(File, Text) :-
    open(File, write, Stream),
    write(Stream, Text),
    close(Stream).

% Step 1: Create Leaves for Each Character and Frequency
char_frequency(Text, FrequencyList) :-
    get_frequency(Text, [], FrequencyList).

get_frequency([], FreqList, FreqList).
get_frequency([Char | Rest], Acc, FreqList) :-
    update_frequency(Char, Acc, UpdatedAcc),
    get_frequency(Rest, UpdatedAcc, FreqList).

update_frequency(Char, [], [leaf(Char, 1)]).
update_frequency(Char, [leaf(Char2, Freq) | Rest], [leaf(Char2, NewFreq) | Rest]) :-
    Char == Char2,
    NewFreq is Freq + 1.
update_frequency(Char, [leaf(Char2, Freq) | Rest], [leaf(Char2, Freq) | UpdatedRest]) :-
    Char \== Char2,
    update_frequency(Char, Rest, UpdatedRest).

% Step 2: Create the Huffman Tree
create_huffman_tree([Tree], Tree). % Single element is the tree
create_huffman_tree(Trees, ResultTree) :-
    merge_two_least_frequent(Trees, MergedTree, RemainingTrees),
    merge_sort([MergedTree | RemainingTrees], NewQueue),
    create_huffman_tree(NewQueue, ResultTree).

merge_two_least_frequent([Tree1, Tree2 | Rest], node(Freq, Tree1, Tree2), Rest) :-
    frequency(Tree1, Freq1),
    frequency(Tree2, Freq2),
    Freq is Freq1 + Freq2.

frequency(leaf(_, Freq), Freq).
frequency(node(Freq, _, _), Freq).

% Step 3: Encode the Huffman Tree
encode_huffman_tree(Tree, Encoding) :-
    create_encoding(Tree, "", Encoding).

create_encoding(leaf(Char, _), Encoding, [(Char, Encoding)]).
create_encoding(node(_, Left, Right), Encoding, Result) :-
    create_encoding(Left, Encoding + "0", LeftEncoding),
    create_encoding(Right, Encoding + "1", RightEncoding),
    append(LeftEncoding, RightEncoding, Result).

% Step 4: Generate Encoded Text
generate_encoded_text([], _, "").
generate_encoded_text([Char | Rest], Encoding, EncodedText) :-
    get_encoding(Char, Encoding, EncodedChar),
    generate_encoded_text(Rest, Encoding, RestEncodedText),
    string_concat(EncodedChar, RestEncodedText, EncodedText).

get_encoding(Char, [(Char, Encoding) | _], Encoding).
get_encoding(Char, [_ | Rest], Encoding) :-
    get_encoding(Char, Rest, Encoding).

% Merge Sort for Sorting Trees by Frequency
merge_sort([], []).
merge_sort([A], [A]).
merge_sort(List, Sorted) :-
    split(List, L1, L2),
    merge_sort(L1, Sorted1),
    merge_sort(L2, Sorted2),
    merge(Sorted1, Sorted2, Sorted).

split([], [], []).
split([A], [A], []).
split([A, B | Rest], [A | L1], [B | L2]) :-
    split(Rest, L1, L2).

merge([], L, L).
merge(L, [], L).
merge([A | As], [B | Bs], [A | Merged]) :-
    frequency(A, FreqA),
    frequency(B, FreqB),
    FreqA =< FreqB,
    merge(As, [B | Bs], Merged).
merge([A | As], [B | Bs], [B | Merged]) :-
    frequency(A, FreqA),
    frequency(B, FreqB),
    FreqA > FreqB,
    merge([A | As], Bs, Merged).