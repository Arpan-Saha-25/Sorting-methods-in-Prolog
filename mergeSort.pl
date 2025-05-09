% divide
split([], [], []).
split([A], [A], []).
split([A, B | T], [A | L], [B | R]) :-
    split(T, L, R).

% merge
merge([], R, R).
merge(L, [], L).
merge([A | L], [B | R], [A | Z]) :-
    A =< B,
    merge(L, [B | R], Z).
merge([A | L], [B | R], [B | Z]) :-
    A > B,
    merge([A | L], R, Z).

% main code
mergesort([], []).
mergesort([A], [A]).
mergesort(In, Out) :-
    split(In, L, R),
    mergesort(L, L2),
    mergesort(R, R2),
    merge(L2, R2, Out).

% output
% 7 ?- mergesort([5,4,3,2,1],X).
% X = [1, 2, 3, 4, 5] .