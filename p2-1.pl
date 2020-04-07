% NEXT PROBLEMA 8
% el = number
% list = el*
% Remove all instances of an element from a list
% remove_elem(E:atom, L:list, R:list)
% flow model: (i i o), (i i i)
remove_elem(_, [], []).
remove_elem(E, [H|T], R) :-
	E = H,
	remove_elem(E, T, R).
remove_elem(E, [H|T], [H|R]) :-
	E \= H,
	remove_elem(E, T, R).

% Remove any repeating elements of a list
% and leave only one occurence of each nr
% remove_recuring_elems(L:list, R:list)
% flow model: (i o), (i i)
remove_recuring_elems([], []).
remove_recuring_elems([H|T], [H|X]) :-
	remove_elem(H, T, Y),
	remove_recuring_elems(Y, X).

% Insert an element into a sorted list
% at its sorted position
% insert(E:int, L:list, R:list
% flow model: (i i o), (i i i)
insert(E, [], [E]).
insert(E, [H|T], [E|Tr]) :-
	E =< H,
	insert(H, T, Tr).
insert(E, [H|T], [H|Tr]) :-
	E > H,
	insert(E, T, Tr).

% Sort a list and return the result
% sort_list(L:list, R:list)
% flow model: (i o), (i i)
sort_list([],[]).
sort_list([H|T], R):- sort_list(T, Res), insert(H, Res, R).

% Remove recuring elements from a list and sort it
% sort_with_removing_doubles(L:list, R:list)
% flow model: (i o), (i i)
sort_wrapper([], []).
sort_wrapper(L, R) :-
	remove_recuring_elems(L, S),
	sort_list(S, R).


% test(L:list)
test([H|T]) :- write(H) ,write(T).
test(A) :- write(A).

% sort_het_list(L:List, R:list)
% flow model: (i o), (i, i)
sort_het_list([], []).
sort_het_list([[H|T1]|T], [Res|R]) :-
	sort_wrapper([H|T1],Res),
	sort_het_list(T, R).
sort_het_list([H|T], [H|R]) :-
	sort_het_list(T, R).
