-module(sellaprime_app).
-behaviour(application).
-export([start/2, stop/1]).

start(_Type, StartArgs) ->
    io:format("about to call sellaprime_supervisor:start_link~n"),
    sellaprime_supervisor:start_link(StartArgs).

stop(_State) ->
    ok.
