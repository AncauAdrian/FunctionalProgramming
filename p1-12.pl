%el = number
%list = el*
%
%
%%remove(L1 : list, Elem : number, R : list)
%flow model (i,i,o)


% replace2(L1 : list, ReplacementL : list, e : int, R : list)
% flow model: (i,i,i,o)
replace2([],[],_,[]).
replace2([_|T],[],_,T).
replace2([H|T], Rep, E, [H|R]) :-
    E \= H,
    replace2(T, Rep, E, R).
replace2([H|T], [H1|T1], E, [H1|R]) :-
    E = H,
    replace2([H|T], T1, E, R).


remove([],_,[]).
remove([H|T], Elem, [H|T1]):- Elem \= 1, Elem1 is Elem - 1,
    remove(T, Elem1, T1).
remove([_|T], Elem, R):- Elem = 1, R = T.
