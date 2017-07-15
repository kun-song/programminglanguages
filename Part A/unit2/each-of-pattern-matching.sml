(*
   1. case 表达式只有一个分支是非常不好的风格；
   2. 
*)

fun sum_triple t =
  case t of  (* 不良风格：case 表达式只有一个 case 分支！ *)
      (x, y, z) => x + y + z;

val result = sum_triple (1, 2, 3) = 6;

fun full_name r =
  case r of
      {first = x, middle = y, last = z} => x ^ " " ^ y ^ " " ^ z;

val result = full_name {first = "Kyke", middle = "", last = "Song"};

(* 使用 variable binding 改进 *)
fun sum_triple2 t =
  let val (x, y, z) = t
  in
      x + y + z
  end;

val result = sum_triple2 (1, 2, 3) = 6;

fun full_name2 r =
  let val {first = x, middle = y, last = z} = r
  in
      x ^ " " ^ y ^ " " ^ z
  end;

val result = full_name {first = "Kyke", middle = "", last = "Song"};

(* 使用 function binding 改进 *)
fun sum_triple3 (x, y, z) =
  x + y + z;

fun full_name {first = x, middle = y, last = z} =
  x ^ " " ^ y ^ " " ^ z;

val result = sum_triple3 (1, 2, 3) = 6;
val result = full_name {first = "Kyle", middle = "", last = "Song"};

