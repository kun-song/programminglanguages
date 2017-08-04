(* 使用模块管理名字空间 *)

(* 该模块有 3 个绑定 *)
structure MyMathLib =
struct
fun fact x = if x = 0
	      then 1
	      else x * fact(x-1)
val half_pi = Math.pi / 2.0
fun doubler x = x + x
end;

val pi = MyMathLib.half_pi + MyMathLib.half_pi;
val v28 = MyMathLib.doubler 14;

(* 暴露 MyMathLib 模块的所有绑定 *)
open MyMathLib;

val v28' = doubler 14;
