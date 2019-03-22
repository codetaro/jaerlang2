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


%% Part 1
get_mod_with_most_exports() ->
  Mods = [Mod || {Mod, _Path} <- code:all_loaded()],
  L = lists:map(fun(X) -> get_num_of_exports(X) end, Mods),
  [H | _T] = lists:sort(fun(A, B) -> sort_mod_by_exports_desc(A, B) end, L),
  H.

get_num_of_exports(Mod) ->
  {Mod, length(Mod:module_info(exports))}.

sort_mod_by_exports_desc(Mod1, Mod2) ->
  {_, N} = Mod1,
  {_, M} = Mod2,
  N > M.

%% Part 2
get_most_common_func_name() ->
  Mods = [Mod || {Mod, _Path} <- code:all_loaded()],
  T1 = lists:merge([get_func_and_freq_per_mod(M) || M <- Mods]),
  merge_tuples(T1).

% get how many times a func name been used in a module
get_func_and_freq_per_mod(Mod) ->
  L = [Name || {Name, _Arity} <- Mod:module_info(exports)],
  T = [get_count(N, L) || N <- L],
  remove_duplicate(T, []).

get_count(Name, L) ->
  get_count(Name, L, 0).

get_count(Name, [], Count) ->
  {Name, Count};
get_count(Name, L, Count) ->
  [H | T] = L,
  case Name =:= H of
    true -> get_count(Name, T, Count + 1);
    false -> get_count(Name, T, Count)
  end.

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
  merge_tuples(L, []).

merge_tuples([], Acc) ->
  Acc;
merge_tuples(L, Acc) ->
  erlang:error(not_implemented).

% sum up {func, times} for all modules

% get most common func name

%% Part 3
get_unique_func_names() ->
  erlang:error(not_implemented).
