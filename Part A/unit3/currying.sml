(* 利用 currying 可以实现函数多参的效果 *)

(*
   1. 利用 tuple 实现多参
*)
fun sorted3_tuple (x, y, z) = z >= y andalso y >= x;

(*
   2. 利用 currying 实现多参
*)
val sorted3 = fn x => fn y => fn z => z >= y andalso y >= x;

(*
   语法糖
*)
fun sorted3_nicer x y z = z >= y andalso y >= x;

(*
   柯里化的 fold
*)
fun fold f acc xs =
  case xs of
      [] => acc
    | x :: xs' => fold f (f(acc, x)) xs';

val sum = fold (fn (acc, x) => acc + x) 0;
fun sum2 xs = fold (fn (acc, x) => acc + x) 0 xs;


(* 测试用例 *)
val test1 = sorted3_tuple (2, 7, 11) = true;
val test2 = sorted3_tuple (8, 7, 11) = false;

(*
   1. sorted3 3 返回一个闭包，且 x maps to 3
   2. sorted3 3 7 计算 1 返回的闭包，返回一个闭包，且 x maps to 3, y maps to 4
   3. sorted3 3 7 11 计算 2 返回的闭包，获得结果为 true
*)
val test3 = sorted3 3 7 11 = true;
val test4 = sorted3 8 7 11 = false;

val test5 = sorted3_nicer 3 7 11 = true;
val test6 = sorted3_nicer 8 7 11 = false;

val test7 = sum [1,2,3] = 6;
val test8 = sum2 [1,2,3] = 6;
