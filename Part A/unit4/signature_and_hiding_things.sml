(* signature ： 模块的类型 *)
signature MATHLIB =
sig
    val fact: int -> int
    val half_pi: real
    val doubler: int -> int
end;

(* :> 符号表明，MathLib 模块必须具备 MATHLIB 签名声明所有绑定，且类型必须正确 *)
structure MathLib :> MATHLIB =
struct
fun fact x = if x = 0 then 1 else x * fact(x-1)
val half_pi = Math.pi / 2.0
fun doubler x = x + x

fun triple x = x * 3 (* triple 不包含在 signature 变量列表中，只能在模块内使用 *)
end;

val v28 = MathLib.doubler 14 = 28;
