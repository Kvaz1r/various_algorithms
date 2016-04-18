-module(numeric).
-export([rk4/5]).

rk4(Tstart,Tend,H,F,X0) when is_number(Tstart) or is_number(X0)->
  rk4([Tstart],Tend,H,F,[X0]);
rk4([H|_]=List,Tend,_H,_Func1,X) when H>=Tend->
  lists:zip(lists:reverse(List),lists:reverse(X));
rk4([Ttemp|_]=T,Tend,H,Func1,[Xtemp|_]=X)->
  K1 = H * Func1(Ttemp, Xtemp),
  K2 = H * Func1(Ttemp+H/2, Xtemp+K1/2),
  K3 = H * Func1(Ttemp+H/2, Xtemp+K2/2),
  K4 = H * Func1(Ttemp+H, Xtemp+K3),
  Add = (K1+2*K2+2*K3+K4)/6,
  rk4([Ttemp+H|T],Tend,H,Func1, [Add+Xtemp |X]).


