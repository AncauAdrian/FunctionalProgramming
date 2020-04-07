% add(L : list, C : int, V : int, R : list)
% (i, o, i, o)

inverse([], C, C).
inverse([H|T], C, R) :- inverse(T, [H|C], R).

add([], V, V, []).
add([H|T], 1, V, R) :-
    add(T, C, V, R1),
    Re is H + C,
    Re >= 10,
    H1 is Re - 10,
    R = [H1|R1].
add([H|T], 0, V, R) :-
    add(T, C, V, R1),
    Re is H + C,
    Re < 10,
    R = [Re|R1].

