/*
f(x) = y = 0 if x < 3
         = 2 if 3<= x < 6
         = 4 if  x>=6

*/

f(X,0):-X<3,!.
f(X,2):-X<6,!.
f(X,4).


% Find the max of two numbers with and without cuts.
max(X,Y,X):- X >= Y.
max(X,Y,Y):- Y >= X.

maxi(X,Y,X):-X>Y,!.
maxi(_,Y,Y).

% write member function 
exists(X, [X | _]).
exists(X, [_ | Rest]) :- exists(X, Rest).

exist_(X,[X|_]):-!.
exist_(X,[_|L]):-exist(X,L).

% Delete the first occurences of an element in a list
efface(_,[],[]).
efface(_,[X|L],L):-!.
efface(X,[A|L],[A|L1]):-efface(X,L,L1).

% 5/5/25
% Sum of all elements of a list 
sumlist([],0).
sumlist([X|Rest],Sum):-sumlist(Rest,SumRest),Sum is SumRest+X.

/*
! Find the GCD of numbers
Given 2 +ve ints x and y, find d or thier GCD.
There are following cases:
if x = y then d = x (or y)
if x < y then d = gcd(x,y-x)
if y < x then d = gcd(y,x-y)
*/
gcd(X,X,X):-!.
gcd(X,Y,D):- X<Y,!, Y1 is Y-X, gcd(X,Y1,D).
gcd(X,Y,D):- gcd(Y,X,D).

/* Define a predicate fibonacci(X,Y) to mean Y is the exact fibo number of X. */
fibo(0,1).
fibo(1,1).
fibo(N,M):-N1 is N-1, N2 is N-2, fibo(N1,M1), fibo(N2,M2), M is M1+M2.

/* Define a predicate factorial(x,y) where factorial of x is y. */
facto(0,1).
facto(N,P):- N1 is N-1, facto(N1,P1), P is N * P1.

/* 
! monkey banana problem :
1. There is a room.
2. Monkey is at the "door" of the room.
3. Banana is hanging in the middle of the room to the ceiling.
4. A box is there, "at the window" that the monkey can use.
5. The monkey is hungry and wants to get the banana but he cannot stretch high enough from the floor.

* The monkey can perform the folloing oprtn:
a. "walk" on the floor.
b. "climb" the box, if the monkey is on floor and at the box.
c. "push" the box around, if the monkey is on floor and at the box.
d. "grasp" the banana, if standing under the box directly under banana.

* The problem is , can the monkey get the banana?
*/

canget(f):-f.
canget(S1):-move(S1,H,S2), canget(S2).

% where f is the final state from where the monkey can get the banana and 
% move is a relation to move from a state 1 to state2 by m.
% States 
% 1. horizontal location of the Monkey. (at door, at window)
% 2. vertical location of the monkey.(on box, on floor)
% 3. rotation on the box(at door, at window, at middle, elsewhere)
% So the structure of the related states are : 

state(HLOCM, VLOCM, LOCB, POS).
%INITIAL STATE
state(atdoor, onfloor, atwindow, atbox).
state(middle, onbox, middle, has).
state(_,_,_,has).
/* 
Moves that describes the problem are 1. grasp
This is possible when on the box, at middle, under banana and "hasnot" (currently doesnot obtained) banana
*/
move(state(middle, onbox, middle, hasnot),grasp,state(middle, onbox, middle, has)).

% 2. climb
% if the monkey is on the floor, at the box 

move(state(H, onfloor, H,P), climb,state(H, onbox, H, P)).

% 3. Push p1,p2 where p1 and p2 are horizontal pos. 
% This possible when monkey is on floor, pos of monkey and box remains same.

move(state(H1,onfloor, H1, P),walk(H1,H2), state(H2, onfloor, H1, P)).

% Now, the canget is :
canget(state(_,_,_,has)).
canget()
