% Insertion Sort - Ascending
insertionSort([H | List], Result) :-
    insertionSort(List, Temp),
    printlist(Temp),
    insertItem(H, Temp, Result).

insertionSort([], []).

insertItem(X, [H | List], [H | Result]) :- 
    H < X, 
    insertItem(X, List, Result).

insertItem(X, List, [X | List]).

% print intermediate outputs
printlist([]) :- nl.
printlist([Head | List]) :-
    write(Head), write(' '),
    printlist(List).


% output 
% 8 ?- insertionSort([5, 4, 2, 1, 3], X).

% 3
% 1 3
% 1 2 3
% 1 2 3 4
% X = [1, 2, 3, 4, 5] .