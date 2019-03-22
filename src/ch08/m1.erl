%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Mar 2019 15:46
%%%-------------------------------------------------------------------
-module(m1).
-author("dennisyuan").

%% API
-export([loop/1]).

-ifdef(debug_flag).
-define(DEBUG(X), io:format("DEBUG ~p:~p ~p~n", [?MODULE, ?LINE, X])).
-else.
-define(DEBUG(X), void).
-endif.

loop(0) ->
  done;
loop(N) ->
  ?DEBUG(N),
  loop(N - 1).