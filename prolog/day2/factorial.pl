factorial(1, Result) :- Result = 1.
factorial(N, Result) :- 
    N > 1,
    N1 is N-1,
    factorial(N1, Result2),
    Result is N * Result2.
