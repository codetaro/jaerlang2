%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Mar 2019 17:43
%%%-------------------------------------------------------------------
-module(attrs).
-vsn(1234).
-author({dennis, yuan}).
-purpose("example of attributes").

%% API
-export([fac/1]).


fac(1) -> 1;
fac(N) -> N * fac(N - 1).