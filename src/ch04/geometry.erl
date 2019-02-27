%%%-------------------------------------------------------------------
%%% @author dennisyuan
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. Feb 2019 16:41
%%%-------------------------------------------------------------------
-module(geometry).
-author("dennisyuan").
-import(math, [pi/0, sqrt/1]).

%% API
-export([area/1, perimeter/1, test_area/0, test_perimeter/0]).


area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> pi() * Radius * Radius;
area({right_triangle, A, B}) -> A * B / 2.

perimeter({rectangle, Width, Height}) -> (Width + Height) * 2;
perimeter({square, Side}) -> Side * 4;
perimeter({circle, Radius}) -> 2 * pi() * Radius;
perimeter({right_triangle, A, B}) -> A + B + sqrt(A * A + B * B).

test_area() ->
  12 = area({rectangle, 3, 4}),
  144 = area({square, 12}),
  6.0 = area({right_triangle, 3, 4}),
  test_area_worked.

test_perimeter() ->
  14 = perimeter({rectangle, 3, 4}),
  48 = perimeter({square, 12}),
  12.0 = perimeter({right_triangle, 3, 4}),
  test_perimeter_worked.