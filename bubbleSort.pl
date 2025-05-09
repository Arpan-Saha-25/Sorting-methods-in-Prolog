% bubble Sort - Ascending
bubbleSort(InputList, SortList) :-
    swap(InputList, List), !,
    printlist(List),
    bubbleSort(List, SortList).

bubbleSort(SortList, SortList).

swap([X, Y | List], [Y, X | List]) :-
    X > Y.
swap([Z | List], [Z | List1]) :-
    swap(List, List1).

% print intermediate   lists
printlist([]) :- nl.
printlist([Head | List]) :-
    write(Head), write(' '),
    printlist(List).


% output
% bubbleSort([4, 2, 5, 1, 3], Sorted).    
% 2 4 5 1 3
% 2 4 1 5 3
% 2 1 4 5 3
% 1 2 4 5 3
% 1 2 4 3 5
% 1 2 3 4 5
% Sorted = [1, 2, 3, 4, 5].