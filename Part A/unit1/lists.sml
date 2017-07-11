(* 与 Java 类似，同一 list 中元素类型必须相同 
   操作 list 的函数基本都是递归的，因为无法获取 list 长度
*)

(* helper function to produce an int list *)
fun count_to(x: int) =
  let fun count(from: int) =
	if from = x
	then x :: []
	else from :: count(from + 1)
  in
      count 1
  end;

fun sum_list(xs: int list) =
  if null xs
  then 0
  else hd xs + sum_list(tl xs);

(* produce [n, n-1, ... , 1] *)
fun countdown(x: int) =
  if x = 0
  then []
  else x :: countdown(x - 1);

fun append(xs: int list, ys: int list) =
  if null xs
  then ys
  else hd xs :: append(tl xs, ys);
