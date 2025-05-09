selectionsort([], []).
selectionsort([A], [A]).
selectionsort(In, [Min | Out]) :-
    findMin(In, Min),
    removeElement(In, Min, L),
    selectionsort(L, Out).

findMin([A], A).
findMin([H | T], H) :-
    findMin(T, Z),
    H =< Z.
findMin([H | T], Z) :-
    findMin(T, Z),
    H > Z.

removeElement([A], A, []).
removeElement([H | T], H, T).
removeElement([H | T], X, [H | Z]) :-
    X \== H,
    removeElement(T, X, Z).

% output
% 8 ?- selectionsort([5,4,3,2,1],X). 
% X = [1, 2, 3, 4, 5] .