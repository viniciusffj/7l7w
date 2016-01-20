-module(string_count).
-export([word_count/1]).

word_count([]) -> 1;
word_count([32|T]) -> word_count(T) + 1;
word_count([_|T]) -> word_count(T).
