% collcount.pl
% Jon Rippe
% CSCE 331 - Spring 2021
% HW 7


% n is pos integer & c is number of iterations of the
% Collatz function required to take n to 1
collcount(1, C) :- C is 0, !.

collcount(N, C) :-
    0 is mod(N, 2),
    N0 is N/2,
    collcount(N0, C0),
    C is C0+1, !.

collcount(N, C) :-
    N0 is (N*3)+1,
    collcount(N0, C0),
    C is C0+1.