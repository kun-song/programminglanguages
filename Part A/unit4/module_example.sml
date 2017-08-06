(*
   client 可能会错误的直接使用 rational 的构造函数，但若简单的移除构造函数，类型检查错误
*)
signature RATIONAL_A =
sig
    datatype rational = Whole of int | Frac of int * int
    exception BadFrac
    val make_frac: int * int -> rational
    val add: rational * rational -> rational
    val toString: rational -> string
end;

(*
   rational 被定义为 abstract type，则 add 等可以继续使用 rational，同时 client 无法使用其构造函数
*)
signature RATIONAL_B =
sig
    type rational (* abstract type *)
    exception BadFrac
    val make_frac: int * int -> rational
    val add: rational * rational -> rational
    val toString: rational -> string
end;

(*
   暴露构造函数 Whole，用户认为其为普通函数，无法得知它是构造函数
*)
signature RATIONAL_C =
sig
    type rational (* abstract type *)
    exception BadFrac
    val Whole: int -> rational
    val make_frac: int * int -> rational
    val add: rational * rational -> rational
    val toString: rational -> string
end;

structure Rational1 :> RATIONAL_C =
struct

datatype rational = Whole of int | Frac of int * int;
exception BadFrac;

fun gcd x y =
  if x = y
  then x
  else
      if x < y
      then gcd x (y-x)
      else gcd y x;

fun reduce r =
  case r of
      Whole _ => r
    | Frac (x, y) => if x = 0
		     then Whole 0
		     else let val d = gcd (abs x) y
			  in
			      if d = y
			      then Whole(x div d)
			      else Frac(x div d, y div d)
			  end;

fun make_frac (x, y) = if y = 0
		      then raise BadFrac
		      else
			  if y < 0
			  then reduce(Frac(~x, ~y))
			  else reduce(Frac(x, y));

fun add (r1, r2) =
  case (r1, r2) of
      (Whole i, Whole j) => Whole(i+j)
    | (Whole i, Frac(j, k)) => Frac(i*k + j, k)
    | (Frac(j, k), Whole i) => Frac(i*k + j, k)
    | (Frac(a, b), Frac(c,d)) => reduce(Frac(a*d + c*b, d*d)); 

fun toString r =
  case r of
      Whole i => Int.toString i
    | Frac(a, b) => (Int.toString a) ^ "/" ^ (Int.toString b);
end;
