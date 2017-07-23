(* First class functions: 函数可以作为其他函数的参数 *)

(* 一些未使用函数参数的例子 *)

fun increment_n_times_lame (n, x) = (* a silly way to compute n + x *)
  if n = 0
  then x
  else 1 + increment_n_times_lame (n-1, x); (* 1 + ... *)

val test1 = increment_n_times_lame (10, 2) = 12;

fun double_n_times_lame (n, x) = (* 2^n *)
  if n = 0
  then x
  else 2 * double_n_times_lame (n-1, x); (* 2 * ... *)

val test2 = double_n_times_lame (3, 2) = 16;

fun nth_tail_lame (n, xs) =
  if n = 0
  then xs
  else tl (nth_tail_lame (n-1, xs)); (* tl ... *)

val test3 = nth_tail_lame (2, [1,2,3,4]) = [3,4];

(* 以上三个函数，只有 else 分支的操作不同，都不同，可以将其抽象为函数，作为参数传入 *)
fun n_times (f, n, x) =
  if n = 0
  then x
  else f (n_times (f, n-1, x));

fun incr x = x + 1;
fun double x = x + x;

val test4 = n_times(incr, 10, 2) = 12;
val test5 = n_times(double, 3, 2) = 16;
val test6 = n_times(tl, 2, [1,2,3,4]) = [3,4];

fun addition (n, x) = n_times (incr, n, x);
fun double_n_times (n, x) = n_times (double, n, x);
fun nth_tail (n, x) = n_times (tl, n, x);
