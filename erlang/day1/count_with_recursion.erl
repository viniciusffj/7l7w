-module(count_with_recursion).
-export([count_to_ten/0]).

count_to_ten_from(10) -> 10;
count_to_ten_from(N) -> count_to_ten_from(N + 1).

count_to_ten() -> count_to_ten_from(10).
