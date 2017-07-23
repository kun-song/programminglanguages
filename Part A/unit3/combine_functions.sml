(* 组合函数 *)

(* 
   f g 都是函数，通过 compose 函数组合在一起
   ('a -> 'b) * ('c -> 'a) -> 'c -> 'b
   
   接受 g 的参数，获得 f 的结果；g 只是中间阶段
*)
fun compose (f, g) = fn x => f(g x);

fun sqrt_of_abs1 i =  Math.sqrt (Real.fromInt (abs i));

(* o 与 compose 函数的作用相同 *)
fun sqrt_of_abs2 i = (Math.sqrt o Real.fromInt o abs) i;

val sqrt_of_abs3 = Math.sqrt o Real.fromInt o abs;

(* 定义 right -> left 组合函数 *)
infix !>;
fun f !> g = g o f;

val sqrt_of_abs4 = abs !> Real.fromInt !> Math.sqrt;


val test1 = sqrt_of_abs1 ~9;
val test2 = sqrt_of_abs2 ~9;
val test3 = sqrt_of_abs3 ~9;
val test4 = sqrt_of_abs4 ~9;
