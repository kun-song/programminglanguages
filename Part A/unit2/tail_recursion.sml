(*
   尾递归：编译器会识别尾递归，并进行优化
*)

fun fact n =
  if n = 0
  then 1
  else n * fact (n-1);

val result = fact 3 = 6;

fun fact2 n =
  let fun aux (n, acc) =
	if n = 0
	then acc
	else aux (n - 1, acc * n) (* tail recursion *)
  in
      aux (n, 1)
  end;

val result = fact2 3 = 6;

fun sum1 xs =
  case xs of
      [] => 0
    | x :: xs' => x + sum1 xs';

val result = sum1 [1,2,3] = 6;

fun sum xs =
  let fun aux (xs, acc) =
	case xs of
	    [] => acc
	  | x :: xs' => aux (xs', x + acc)
  in
      aux (xs, 0)
  end;

val result = sum [1,2,3] = 6;

(*
   没有使用尾递归优化的翻转函数，O(n^2)
*)
fun reverse1 xs =
  case xs of
      [] => []
    | x :: xs' => reverse1 (xs') @ [x];

val result = reverse1 [1,2,3];
val result = reverse1 [];
  
(*
   使用尾递归优化后，O(n)
*)
fun reverse xs =
  let fun f (xs, acc) =
	case xs of
	    [] => acc
	  | x :: xs' => f (xs', x :: acc)
  in
      f (xs, [])
  end;

val result = reverse [1,2,3];
