-module(exercises_day_2).
-export([from_key/2, total_price/1]).

from_key(_, []) -> 'None';
from_key(Key, [{Key, Value} | _]) -> Value;
from_key(Key, [{SomeKey, _} | List]) -> from_key(Key, List).

total_price(Catalog) ->  [{Item, Quantity * Price} || {Item, Quantity, Price} <- Catalog].
