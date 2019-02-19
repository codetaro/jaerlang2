%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 19. Feb 2019 16:35
%%%-------------------------------------------------------------------
-module(afile_client).
-author("dennisyuan").

%% API
-export([ls/1, get_file/2, put_file/3]).


ls(Server) ->
  Server ! {self(), list_dir},
  receive
    {Server, FileList} ->
      FileList
  end.

get_file(Server, File) ->
  Server ! {self(), {get_file, File}},
  receive
    {Server, Content} ->
      Content
  end.

put_file(Server, File, Data) ->
  Server ! {self(), {put_file, File, Data}},
  receive
    {Server, Content} ->
      Content
  end.