(* 异常定义 *)
exception MyEmptyException;

(* 抛出异常 *)
fun maxList xs =
  case xs of
      [] => raise MyEmptyException
    | x :: [] => x
    | x :: xs' => Int.max(x, maxList xs');

(* 使用 handle 捕获异常 *)
val result = maxList []
	     handle MyEmptyException => ~1;

(* 抛出传入的异常 *)
fun maxList2 (xs, ex) =
  case xs of
      [] => raise ex
    | x :: [] => x
    | x :: xs' => Int.max(x, maxList2(xs', ex));

val result = maxList2 ([], MyEmptyException)
	     handle MyEmptyException => ~1;
