%%%-------------------------------------------------------------------
%%% Created : 19. Февр. 2016 22:50
%%%-------------------------------------------------------------------
-module(algorithm).
-export([multiply/2]).


multiply(A, B) ->
  karatsuba(A, B).

karatsuba(X, Y) when X < 10, Y < 10 -> X * Y;
karatsuba(X, Y) ->
  Len = max(length(integer_to_list(X)), length(integer_to_list(Y))),
  N = round(Len / 2),
  {A, B} = make_pair(X, Len),
  {C, D} = make_pair(Y, Len),
  Temp1 = karatsuba(A, C),
  Temp2 = karatsuba(B, D),
  Temp3 = karatsuba(A + B, C + D),
  pow10(2 * N) * Temp1 + Temp2 + pow10(N) * (Temp3 - Temp2 - Temp1).

pow10(N) when N =:= 0 -> 1;
pow10(N) -> 10 * pow10(N - 1).

make_pair(P, Len) ->
  List = integer_to_list(P),
  L = length(List),
  Temp = round(Len / 2),
  if
    L - Temp > 0 ->
      Middle = L - Temp,
      {list_to_integer(lists:sublist(List, 1, Middle)),
        list_to_integer(lists:sublist(List, Middle + 1, Temp))};
    true -> {0, P}
  end.