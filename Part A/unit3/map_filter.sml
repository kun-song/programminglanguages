(* map filter 是两个常见的高阶函数 *)

fun map (f, xs) = (* 在列表 xs 的每个元素上应用函数 f，返回 f x 组成的列表 *)
  case xs of
      [] => []
    | x :: xs' => (f x) :: map(f, xs');

val test1 = map (fn x => x + 1, [1,2,3]) = [2,3,4];
val test2 = map (hd, [[1,2,3], [3,4,5]]) = [1,3];

fun filter (f, xs) = (* 遍历 xs，取 f x 为 true 的元素，组成新列表 *)
  case xs of
      [] => []
    | x :: xs' => if f x
		  then x :: filter(f, xs')
		  else filter(f, xs');

val test3 = filter(fn x => x mod 2 = 0, [1,2,3,4]) = [2,4];
val test4 = filter(fn (_, x) => x mod 2 = 0, [(false, 2), (true, 3), (false, 4)]) = [(false, 2), (false, 4)];
