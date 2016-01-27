-module(translator_monitor).
-export([loop/0]).

loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring translator service.~n"),
            register(translator, spawn_link(fun translate:loop/0)),
            loop();
        {'EXIT', _, _} -> 
            io:format("The translator service has died ... restarting"),
            self() ! new,
            loop()
    end.

