%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 01. Mar 2019 15:53
%%%-------------------------------------------------------------------
-module(json).
-author("dennisyuan").

%% API
-export([read_config/1]).


read_config(File) ->
  {ok, Content} = file:read_file(File),
  case validate(Content) of
    {true, true} -> maps:from_json(Content);
    {_, _} -> error
  end.

validate(Bin) ->
  Binary = binary:replace(Bin, [<<"{">>, <<"}">>], <<"">>),
  List = binary:split(Binary, <<",">>, [global]),
  List2 = lists:map(fun(X) -> binary:split(X, <<":">>) end, List),
  Keys = [Key || [Key, _] <- List2],
  Values = [Value || [_, Value] <- List2],
  Pred1 = lists:all(fun(K) -> pseudo:is_json_key(K) end, Keys),
  Pred2 = lists:all(fun(V) -> pseudo:is_json_value(V) end, Values),
  {Pred1, Pred2}.
