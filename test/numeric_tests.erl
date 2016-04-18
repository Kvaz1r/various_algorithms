%%%-------------------------------------------------------------------
%%% Created : 18. Апр. 2016 16:03
%%%-------------------------------------------------------------------
-module(numeric_tests).
-include_lib("eunit/include/eunit.hrl").

rk4_test() ->
  Tstart = 0,
  Tend = 0.5,
  Dt = 0.1,
  ?assert(isEq(get_solveDE(Tstart, Tend, Dt, fun(X) -> 2 * math:exp(X) - X - 1 end),
    numeric:rk4(Tstart, Tend, Dt, fun(X, Y) -> X + Y end, 1), 0.0001)).

get_solveDE(Tstart, Tend, Dt, Fun) ->
  N = trunc((Tend - Tstart) / Dt),
  [fun() -> X = Tstart + I * Dt, {X, Fun(X)} end()
    || I <- lists:seq(0, N)].

isEq(L1, L2, Eps) ->
  lists:all(fun(X) -> X =:= true end,
    lists:zipwith(fun({_, NV}, {_, V}) -> abs(NV - V) < Eps end, L1, L2)).


