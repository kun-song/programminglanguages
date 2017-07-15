
datatype id = StudentNum of string
	    | Name of string * (string option) * string;

fun f id =
  case id of
      StudentNum n => n
    | Name(f, m, l) => f ^ " " ^ (if isSome m then valOf  m ^ " " else "") ^ l;

(* 在 datatype binding 中，只需要对 constructor 指定参数类型即可，不需要写参数名字 *)
datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp;

fun eval e =
  case e of
      Constant i => i
    | Negate e2 => ~(eval e2)
    | Add(e1, e2) => (eval e1) + (eval e2) (* 模式中，可以携带参数名字 *)
    | Multiply(e1, e2) => (eval e1) * (eval e2);

val x = eval(Negate(Add(Constant 2, Constant 3)));

fun number_of_adds e =
  case e of
      Constant i => 0
    | Negate e2 => number_of_adds e2
    | Add(e1, e2) => 1 + number_of_adds e1 + number_of_adds e2
    | Multiply(e1, e2) => number_of_adds e1 + number_of_adds e2;

val adds = number_of_adds(Negate(Add(Constant 2, Constant 3)));
