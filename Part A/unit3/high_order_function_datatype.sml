(* 高阶函数不仅可以用于 int/list，还可以用于自定义的 datatype *)

datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp;

fun true_of_all (f, ex) =
  case ex of
      Constant i => f i
    | Negate i => true_of_all (f, i)
    | Add (x, y) => true_of_all (f, x) andalso true_of_all (f, y)
    | Multiply (x, y) => true_of_all (f, x) andalso true_of_all (f, y);


fun all_even e = true_of_all (fn x => x mod 2 = 0, e);

val test1 = all_even (Add (Constant ~1, Negate (Constant 2))) = false;
val test2 = all_even (Add (Multiply(Constant 4, Constant 2), Negate (Constant 2))) = true;

fun all_positive e = true_of_all (fn x => x > 0, e);

val test1 = all_positive (Add (Constant ~1, Negate (Constant 2))) = false;
val test2 = all_positive (Add (Multiply(Constant 4, Constant 2), Negate (Constant 2))) = true;

