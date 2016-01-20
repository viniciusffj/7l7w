-module(error_handling).
-export([print_message/1]).

print_message({error, Message}) -> io:format("error:~p", [Message]);
print_message(success) -> io:format("success").
