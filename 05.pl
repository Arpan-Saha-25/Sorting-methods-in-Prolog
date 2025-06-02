% % successor
% length([],0).
% length([X|L], s(N)) :- length(L,N).


% % check even
% even(0).
% even(s(s(N))) :- even(N).

% % check odd
% odd(s(0)).
% odd(s(s(N))) :- odd(N).  

% % Divisiblity test for 3

% % check if natural number 
% is_natural(0).
% is_natural(s(X)) :- is_natural(X).


% is_less_equal(0,Y) :- is_natural(Y).
% is_less_equal(s(X),s(Y)) :- is_less_equal(X,Y).


% successor-based length of a list
length([], 0).
length([_|L], s(N)) :- length(L, N).

% check even numbers
even(0).
even(s(s(N))) :- even(N).

% check odd numbers
odd(s(0)).
odd(s(s(N))) :- odd(N).

% check if natural number
is_natural(0).
is_natural(s(X)) :- is_natural(X).

% less than or equal check
is_less_equal(0, Y) :- is_natural(Y).
is_less_equal(s(X), s(Y)) :- is_less_equal(X, Y).

% Divisibility by 3
div3(0).
div3(s(s(s(N)))) :- div3(N).

% add function
plus(X,0,X).
plus(s(X),Y,s(Z)):-plus(X,Y,Z).

subtract(X,Y,Z):-plus(Y,Z,X).

% diff(X,0,X).
% diff(X,s(Y),Z) :- diff(X,Y,s(Z)).
diff(X, 0, X).
diff(s(X), s(Y), Z) :- diff(X, Y, Z).


% product

% remainder

% division


/*
Integer	Peano Representation
0	0
1	s(0)
2	s(s(0))
3	s(s(s(0)))
4	s(s(s(s(0))))
5	s(s(s(s(s(0)))))
6	s(s(s(s(s(s(0))))))
7	s(s(s(s(s(s(s(0)))))))
8	s(s(s(s(s(s(s(s(0))))))))
9	s(s(s(s(s(s(s(s(s(0)))))))))
10	s(s(s(s(s(s(s(s(s(s(0))))))))))
*/