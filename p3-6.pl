% giveRa(L : list, E : elem)
% (i, o)
giveRan([H|_], H).
giveRan([_|T], R) :- giveRan(T, R).

% takeArr(L : list, K : int, V : list collector var, R : list)
% (i, i, i, o)
takeArr(_, 0, V, V).
takeArr(L, K, V, R) :- giveRan(L, E),
    not(giveRan(V, E)),
    K1 is K - 1,
    takeArr(L, K1, [E|V], R).

% wrapper function for takeArr
% arrangements(L : list, K : int, R : list)
% (i, i, o)
arrangements(L, K, Res) :- findall(R, takeArr(L, K, [], R), Res).

