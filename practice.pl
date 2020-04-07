

% check(L : list, K : int)
% check(i,i)

count([], 0).
count([_|T], R) :- count(T, R1), R is R1 + 1.

even(L) :- count(L, R), 0 is R mod 2.

check(L, K) :- !, K \= 0, even(L).

remove([], _,[]).
remove([H|T], K, R) :- is_list(H), !, check(H, K), K1 is K - 1, remove(T, K1, R).
remove([H|T], K, [H|R]) :- remove(T, K, R).
