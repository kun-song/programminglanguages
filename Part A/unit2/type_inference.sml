(*
   1. ML 使用模式 + 模式元素操作进行类型推断
*)

fun sum_triple (x, y, z) =
  x + y + z;

(*
   1. int * 'a * int -> int
   2. y 可以为任意类型，泛型
*)
fun partial_sum (x, y, z) =
  x + z;
