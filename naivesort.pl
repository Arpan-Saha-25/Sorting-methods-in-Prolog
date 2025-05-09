% permutation
perm([], []).
perm(List, [H | Perm]) :-
    select(H, List, Rest),
    perm(Rest, Perm).

naive_sort(List, Sorted) :-
    perm(List, Sorted),
    is_sorted(Sorted).

is_sorted([]).
is_sorted([_]).
is_sorted([X, Y | T]) :-
    X =< Y,
    is_sorted([Y | T]).


/*
6 ?-  naive_sort([5,3,4,1,2], M).
M = [1, 2, 3, 4, 5] .
*/