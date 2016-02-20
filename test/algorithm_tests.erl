%%%-------------------------------------------------------------------
%%% Created : 19. Февр. 2016 22:51
%%%-------------------------------------------------------------------
-module(algorithm_tests).
-include_lib("eunit/include/eunit.hrl").


multiply_test() ->
  [fun() -> {X, Y} = {temp(), temp()},
    ?assertEqual(X * Y, algorithm:multiply(X, Y)) end() || _ <- lists:seq(1, 50)].

temp() -> rand:uniform(trunc(math:pow(2, 1000))).
