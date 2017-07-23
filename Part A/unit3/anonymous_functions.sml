
fun n_times (f, n, x) =
  if n = 0
  then x
  else f (n_times (f, n-1, x));


(* 1. double 只在 double_n_times 中有用，所以可以将其定义为 local helper function *)
fun double x = x + x;
fun double_n_times1 (n, x) = n_times (double, n, x);

(* 2. double 函数只在调用 n_times 时才有用，所以可以在函数调用时定义 *)
fun double_n_times2 (n, x) =
  let fun double x = x + x
  in
      n_times (double, n, x)
  end;

(* 3. let 表达式作为函数参数，let 表达式计算结果为 double 函数 *)
fun double_n_times3 (n, x) =
  n_times (let fun double x = x + x in double end, n, x);

(* 4. 省略 let 表达式，并不能编译，因为 binding 不是表达式 *)
(*
fun double_n_times4 (n, x) =
  n_times (fun double x = x + x, n, x);
*)

(* 5. 匿名函数 *)
fun double_n_times (n, x) =
  n_times (fn y => y + y, n, x);


(* 测试用例 *)

val test1 = double_n_times1 (2, 3) = 12;
val test2 = double_n_times2 (2, 3) = 12;
val test3 = double_n_times3 (2, 3) = 12;
val test = double_n_times (2, 3) = 12;


