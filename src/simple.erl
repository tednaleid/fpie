-module(simple).
-export([maxThree/3, xOr/2, xOr2/2, xOr3/2, xOr4/2, howManyEqual/3, fac/1, tfac/1, fib/1, pieces/1, tfib/1, perfect/1]).

xOr(true, false) ->
  true;
xOr(false, true) ->
  true;
xOr(_,_) ->
  false.

xOr2(A, A) ->
  false;
xOr2(_, _) ->
  true.

xOr3(A, B) ->
  A =/= B.

xOr4(A, B) ->
  (A and not B) or (not A and B).


maxThree(A, B, C) ->
  max(A, max(B, C)).

howManyEqual(A, A, A) ->
  3;
howManyEqual(A, A, _) ->
  2;
howManyEqual(A, _, A) ->
  2;
howManyEqual(_, A, A) ->
  2;
howManyEqual(_, _, _) ->
  0.

fac(0) ->
  1;
fac(N) when N > 0 ->
  fac(N-1)*N.

fib(0) ->
  0;
fib(1) ->
  1;
fib(N) when N > 0, N < 40 ->
  fib(N-1) + fib(N-2).

pieces(0) ->
  1;
pieces(N) when N > 0 ->
  pieces(N-1) + N.

tfac(N) ->
  fac(N, 1).

fac(0, P) ->
  P;
fac(N, P) when N > 0 ->
  fac(N-1, P*N).

tfib(0) ->
  0;
tfib(N) ->
  fib(N, 1, 0).

fib(1, Last, BeforeLast) ->
  Last + BeforeLast;
fib(Target, Last, BeforeLast) when Target > 0 ->
  fib(Target-1, Last+BeforeLast, Last).

perfect(Target) when Target > 0 ->
  perfect(Target, 0, Target - 1).

perfect(Target, Target, 0) ->
  true;
perfect(_, _, 0) ->
  false;
perfect(Target, Sum, Current) when Target rem Current == 0 ->
  perfect(Target, Sum + Current, Current - 1);
perfect(Target, Sum, Current) ->
  perfect(Target, Sum, Current - 1).
