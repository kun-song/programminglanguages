(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer;

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern;

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu;

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end;

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string;

(**** you can put all your code here ****)

val only_capitals = List.filter (fn s => Char.isUpper(String.sub(s, 0)));

val longest_string1 = List.foldl (fn (s, acc) => if String.size s > String.size acc then s else acc) "";

val longest_string2 = List.foldl (fn (s, acc) => if String.size s >= String.size acc then s else acc) "";

fun longest_string_helper f = List.foldl (fn (s, acc) => if f(String.size s, String.size acc) then s else acc) "";

(* 部分应用 *)
val longest_string3 = longest_string_helper (fn (a, b) => a > b);
val longest_string4 = longest_string_helper (fn (a, b) => a >= b);

(* 组合函数 *)
val longest_capitalized = longest_string1 o only_capitals;
