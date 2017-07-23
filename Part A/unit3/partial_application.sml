(* 部分应用，与柯里化相伴 *)

fun sorted3 x y z = z >= y andalso y >= x;

fun fold f acc xs =
  case xs of
      [] => acc
    | x :: xs' => fold f (f(acc, x)) xs';

fun range i j = if i > j then [] else i :: range (i+1) j;

fun exists predicate xs =
  case xs of
      [] => false
    | x :: xs' => predicate x orelse exists predicate xs';


(* 提供 fewer 参数调用：部分应用 *)

val is_nonegative = sorted3 0 0; (* 不要写成 fun is_nonegative x = sorted 0 0 x *)

val sum = fold (fn (acc, x) => acc + x) 0; (* 不要写成 fun sum xs = fold (fn (acc, x) => acc + x) 0 xs *)

val countup = range 1; (* 不要写成 fun countup x = range 1 x *)

val has7 = exists (fn x => x = 7);


(* 测试用例 *)
val test_is_nonegative1 = is_nonegative 3 = true;
val test_is_nonegative2 = is_nonegative ~1 = false;
val test_is_nonegative3 = is_nonegative 0 = true;

val test_sum = sum [1,2,3] = 6;

val test_countup = countup 3 = [1,2,3];

val test_has7 = has7 [1,2,3] = false;
val test_has7 = has7 [1,2,7,8] = true;

