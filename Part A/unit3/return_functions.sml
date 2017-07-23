(* 函数作为返回值 *)

(* double_or_triple 接受函数 f 作为参数，并且返回一个函数 *)
fun double_or_triple f =
  if f 7
  then fn x => x * 2
  else fn x => x * 3;

(* 调用 double_or_triple 获取返回函数 *)
val double = double_or_triple (fn x => x = 7);
val triple = double_or_triple (fn x => x <> 7);

val test1 = double 2 = 4;
val test2 = triple 2 = 6;
