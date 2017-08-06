
(* 42 是 int，因此 x 类型为 int *)
val x = 42;

(*
   1. if y 说明 y 为 bool
   2. z + x 说明 z 为 int
   3. w 没有用到，所以为 'a

   整个函数的类型为 bool * int * 'a -> int
*)
fun f (y, z, w) =
  if y
  then z + x
  else 0;
