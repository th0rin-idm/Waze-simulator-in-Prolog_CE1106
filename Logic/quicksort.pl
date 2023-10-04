quicksort([], []).
quicksort([X|Xs], Sorted) :-
    partition(Xs, X, Lows, Highs),
    quicksort(Lows, SortedLows),
    quicksort(Highs, SortedHighs),
    append(SortedLows, [X|SortedHighs], Sorted).

partition([], _, [], []).
partition([[Name1, Dist1]|Ys], [Name2, Dist2], [[Name1, Dist1]|Lows], Highs) :-
    Dist1 =< Dist2,
    partition(Ys, [Name2, Dist2], Lows, Highs).
partition([[Name1, Dist1]|Ys], [Name2, Dist2], Lows, [[Name1, Dist1]|Highs]) :-
    Dist1 > Dist2,
    partition(Ys, [Name2, Dist2], Lows, Highs).



