%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. Mar 2019 17:00
%%%-------------------------------------------------------------------
-module(ex08).
-author("dennisyuan").
-compile(export_all).

%% API
-export([]).


%% Q2.1 which module exports the most functions
get_mod_with_most_exports() ->
  Mods = [Mod || {Mod, _File} <- code:all_loaded()],
  Tups = lists:map(fun(X) -> get_num_of_exports(X) end, Mods),
  [H | _T] = lists:sort(fun(A, B) -> sort_mod_by_exports_desc(A, B) end, Tups),
  io:format("~w~n", [H]).

%% Q2.2 which function name is the most common
get_most_common_func_name() ->
  Mods = [Mod || {Mod, _File} <- code:all_loaded()],
  Tups1 = lists:merge([get_func_and_count(Mod) || Mod <- Mods]),
  Tups2 = lists:keysort(2, maps:to_list(merge_tuples(Tups1))),
  [H | T] = lists:reverse(Tups2),
  io:format("~w~n", [H]).

%% Q2.3 function names that are used in only one module
get_unique_func_names() ->
  Mods = [Mod || {Mod, _File} <- code:all_loaded()],
  Funcs = lists:merge([get_funcs(Mod) || Mod <- Mods]),
  Tups1 = [get_count(Func, Funcs) || Func <- Funcs],
  Tups2 = remove_duplicate(Tups1),
  Uniq = [Func || {Func, Count} <- Tups2, Count =:= 1],
  io:format("~w~n", [Uniq]).

%% helper functions
get_num_of_exports(Mod) ->
  {Mod, length(Mod:module_info(exports))}.

sort_mod_by_exports_desc(Mod1, Mod2) ->
  {_, Exp1} = Mod1,
  {_, Exp2} = Mod2,
  Exp1 > Exp2.

get_func_and_count(Mod) ->
  Funcs = [Func || {Func, _Arity} <- Mod:module_info(exports)],
  Tups = [get_count(Func, Funcs) || Func <- Funcs],
  remove_duplicate(Tups).

get_count(E, L) ->
  get_count(E, L, 0).

get_count(E, [], Count) ->
  {E, Count};
get_count(E, L, Count) ->
  [H | T] = L,
  case E =:= H of
    true ->
      get_count(E, T, Count + 1);
    false ->
      get_count(E, T, Count)
  end.

remove_duplicate(L) ->
  remove_duplicate(L, []).

remove_duplicate([], Acc) ->
  Acc;
remove_duplicate(L, Acc) ->
  [H | T] = L,
  case lists:member(H, T) of
    true ->
      remove_duplicate(T, Acc);
    false ->
      remove_duplicate(T, [H | Acc])
  end.

merge_tuples(L) ->
  merge_tuples(L, #{}).

merge_tuples([{Func, Count} = H | T], Map) ->
  N = maps:get(Func, Map, 0),
  merge_tuples(T, maps:put(Func, N + Count, Map));
merge_tuples([], Map) ->
  Map.

get_funcs(Mod) ->
  Funcs = [Func || {Func, _Arity} <- Mod:module_info(exports)],
  remove_duplicate(Funcs).

%% test
test() ->
  get_mod_with_most_exports(),
  get_most_common_func_name(),
  get_unique_func_names().