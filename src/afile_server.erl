%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Feb 2019 16:07
%%%-------------------------------------------------------------------
-module(afile_server).
-author("dennisyuan").

%% API
-export([start/1, loop/1]).


start(Dir) ->
  spawn(afile_server, loop, [Dir]).

loop(Dir) ->
  receive
    {Client, list_dir} ->
      Client ! {self(), file:list_dir(Dir)};
    {Client, {get_file, File}} ->
      Full = filename:join(Dir, File),
      Client ! {self(), file:read_file(Full)};
    {Client, {put_file, File, Data}} ->
      Full = filename:join(Dir, File),
      Client ! {self(), file:write_file(Full, Data)}
  end,
  loop(Dir).