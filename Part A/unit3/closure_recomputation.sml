(* 减少重复计算 *)

fun filter (f, xs) =
  case xs of
      [] => []
    | x :: xs' => if f x
		  then x :: filter(f, xs')
		  else filter(f, xs');

(* 对于 xs 中的每个元素，传入的闭包都要计算一次，则 String.size s 也需要重复计算很多次 *)
fun allShorterThan1 (xs, s) = filter(fn x => String.size x < (print "!"; String.size s), xs);

(* 如下所示，l 只会计算一次 *)
fun allShorterThan2 (xs, s) =
  let
      val l = (print "!"; String.size s)
  in
      filter (fn x => String.size x < l, xs)
  end;


val test1 = allShorterThan1 (["SSS", "a", "b", "cc"], "ss") = ["a", "b"];
val test2 = allShorterThan2 (["SSS", "a", "b", "cc"], "ss") = ["a", "b"];
