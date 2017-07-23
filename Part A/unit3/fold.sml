(* 除了 map filter 以外，fold 是第三个非常有用的高阶函数，有几个不同变体，又被称为 reduce inject *)

(* 将 列表遍历 与 对列表元素的操作 分离开 *)

(* fold 是对递归结构的遍历，对元素的处理由 f 决定 *)
fun fold (f, acc, xs) =
  case xs of
      [] => acc
    | x :: xs' => fold (f, f(acc, x), xs');

fun sum_list xs = fold (fn (x, y) => x + y, 0, xs);

fun numberInRange (xs, lo, hi) =
  let
      fun f (acc, x) = acc + (if x >= lo andalso x <= hi then 1 else 0)
  in
      fold (f, 0, xs)
  end;

fun areAllShorter (xs, s) =
  let
      val l = String.size s
      fun f (acc, x) = acc andalso String.size x < l (* 注意此处实现 *)
  in
      fold (f, true, xs)
  end;

(* 是否对于所有元素而言，g x 结果都为 true *)
fun allTrue (g, xs) = fold(fn (acc, x) => acc andalso g x, true, xs);

(* 利用 allTrue 重新实现 areAllShorter *)
fun areAllShorter2 (xs, s) =
  let
      val l = String.size s
  in
      allTrue(fn x => String.size x < l, xs)
  end;

val test1 = sum_list [] = 0;
val test2 = sum_list [1,2,3] = 6;

val test3 = numberInRange ([1,2,3,4], 1, 4) = 4;
val test4 = numberInRange ([1,2,3,4], 2, 3) = 2;

val test5 = areAllShorter (["ss", "sss", "s"], "sss") = false;
val test6 = areAllShorter (["ss", "sss", "s"], "ssss") = true;

val test7 = areAllShorter (["ss", "sss", "s"], "sss") = false;
val test8 = areAllShorter (["ss", "sss", "s"], "ssss") = true;
