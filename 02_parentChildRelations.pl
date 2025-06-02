% Parent-child relationships
parent(tem, bob).
parent(pam, bob).
parent(tem, liz).
parent(bob, annd).
parent(bob, pat).
parent(pat, jin).

% Grandparent rule
gp(X, Y) :- parent(X, Z), parent(Z, Y).

% Gender definitions (MISSING ENTRIES ADDED)
female(pam).
female(liz).
female(annd).  % Fixed: Added missing gender
male(bob).
male(tem).
male(pat).  % Fixed: Added missing gender
male(jin).  % Fixed: Added missing gender

% Mother and father definitions
mother(Y, X) :- parent(Y, X), female(Y).
father(Y, X) :- parent(Y, X), male(Y).

% Son and daughter definitions
son(Y, X) :- parent(X, Y), male(Y).
daughter(Y, X) :- parent(X, Y), female(Y).

% Grandfather rule
grandfather(X, Y) :- gp(X, Y), male(X).

% Sibling relationships
brother(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y, male(X).
sister(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y, female(X).

% Negation-based query
has_no_siblings(X) :- \+ brother(X, _), \+ sister(X, _).
