count(0, []).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

sum(0, []).
sum(Sum, [Head|Tail]) :- sum(Acc, Tail), Sum is Acc + Head.

average(Avg, List) :- sum(Total, List), count(Count, List), Avg is Total / Count.

concatenate([], List, List).
concatenate([Head|Tail], List2, [Head|Result]) :- 
    concatenate(Tail, List2, Result).

