(* 柯里化、非柯里化相互转换 *)

fun range (i, j) = if i > j then [] else i :: range(i+1, j);

(* range 非柯里化函数，但想用部分应用（部分应用只能用于柯里化函数） *)

(* curry 将一个 ('a * 'b) -> 'c 函数，转换为柯里化形式 'a -> 'b -> 'c *)
(* 非柯里化 -> 柯里化 *)
fun curry f x y = f(x, y);

(* 调整参数顺序 *)
fun curry2 f x y = f y x; (* fun curry2 f = fn x => fn y => f y x 的语法糖 *)

(* 柯里化 -> 非柯里化 *)
fun uncurry f (x, y) = f x y;

val countup = curry range 1;

(* test cases *)
val test1 = countup 3 = [1,2,3];
