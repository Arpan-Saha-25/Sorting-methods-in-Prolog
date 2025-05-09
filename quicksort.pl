quicksort([], []).
quicksort([A], [A]).
quicksort([A | In], Out) :-
    partition(A, In, L, R),
    quicksort(L, L2),
    quicksort(R, R2),
    append(L2, [A | R2], Out).

append([], L, L).
append([H | T], L, [H | Out]) :-
    append(T, L, Out).

partition(_, [], [], []).
partition(A, [H | T], [H | L], R) :-
    H =< A,
    partition(A, T, L, R).
partition(A, [H | T], L, [H | R]) :-
    H > A,
    partition(A, T, L, R).


% output
% 9 ?- consult('quicksort.pl').      
% true.

% 10 ?- quicksort([5,4,3,2,1],X).       
% X = [1, 2, 3, 4, 5] .
