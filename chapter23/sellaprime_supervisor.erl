-module(sellaprime_supervisor).
-behaviour(supervisor).
-export([start/0, start_in_shell_for_testing/0, start_link/1, init/1]).

start() ->
    spawn(fun() ->
                supervisor:start_link({local, ?MODULE}, ?MODULE, _Arg = [])
          end).

start_in_shell_for_testing() ->
    {ok, Pid} = supervisor:start_link({local, ?MODULE}, ?MODULE, _Arg = []),
    unlink(Pid).
start_link(Args) ->
    io:format("calling supervisor:start_link~n"),
    supervisor:start_link({local, ?MODULE}, ?MODULE, Args).
init([]) ->
    io:format("init sellaprime_supervisor~n"),
    {ok, {{one_for_one, 3, 10},
         [{tag1,
           {area_server, start_link, []},
           permanent,
           10000,
           worker,
           [area_server]}
         ]}}.
