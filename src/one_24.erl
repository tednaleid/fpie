-module(one_24).
-export([area/1, perimeter/1, enclose/1, bits/1, tail_bits/1]).

% Shapes
% Define a function perimeter/1 which takes a shape and returns the perimeter of the shape.
%
% Choose a suitable representation of triangles, and augment area/1 and perimeter/1 to handle this case too.
%
% Define a function enclose/1 that takes a shape an returns the smallest enclosing rectangle of the shape.
%

% the requirements for this were a little vague so I picked the rectangle and triangle shapes
area({rectangle, {Height, Width}}) ->
  Height * Width;

area({triangle, {SideA, SideB, SideC}}) ->
  S = (SideA + SideB + SideC)/2,
  math:sqrt(S * (S - SideA) * (S - SideB) * (S - SideC)).  % heron's formula

perimeter({rectangle, {Height, Width}}) ->
  2 * (Height + Width);

perimeter({triangle, {SideA, SideB, SideC}}) ->
  SideA + SideB + SideC.

enclose({rectangle, {Height, Width}}) ->
  {rectangle, {Height, Width}};

enclose({triangle, {SideA, SideB, SideC}}) ->
  Area = area({triangle, {SideA, SideB, SideC}}),
  Base = lists:min([SideA, SideB, SideC]),
  Height = (2 * Area) / Base,
  {rectangle, {Height, Base}}.


% Summing the bits
% Define a function bits/1 that takes a positive integer N and returns the sum of the bits in the binary representation. For example bits(7) is 3 and bits(8) is 1.
%
% See whether you can make both a direct recursive and a tail recursive definition.
%
% Which do you think is better? Why?

% non-tail recursive version of bits
bits(0) ->
  0;

bits(N) when N rem 2 == 0 ->
  bits(N div 2);

bits(N) ->
  1 + bits(N div 2).

% tail recursive version of bits
tail_bits(N) ->
  tail_bits(N, 0).

tail_bits(0, Total) ->
  Total;

tail_bits(Current, Total) when Current rem 2 == 0  ->
  tail_bits(Current div 2, Total);

tail_bits(Current, Total) ->
  tail_bits(Current div 2, Total + 1).

% Tail recursive is better as it's more memory efficient.  The non-recursive one is a little easier to grok though
