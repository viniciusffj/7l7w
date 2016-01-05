reverse_list([], []).
reverse_list([H|T], R) :-
    reverse_list(T, R1), 
    append(R1, [H], R).

min(X, Y, R) :- X @=< Y, R = X.
min(X, Y, R) :- X @> Y, R = Y.

smallest([H|[]], H).
smallest([H|T], S) :- smallest(T, S1), min(H, S1, S).

sort_list([], []).
sort_list(L, R) :- 
    smallest(L, S), 
    subtract(L, [S], L1),
    sort_list(L1, R1),
    append([S], R1, R).
