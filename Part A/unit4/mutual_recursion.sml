(*
   ML 有两种方式实现 mutal recursion
   1. and 关键字
   2. 高阶函数
*)

fun match xs =
  let
      fun s_need_one s =
	case xs of
	    [] => true
	  | 1 :: xs' => s_need_two xs' (* mutual recursion *)
	  | _ => false
      and s_need_two xs =
	  case xs of
	      [] => false
	    | 2 :: xs' => s_need_one xs' (* mutual recursion *)
	    | _ => false
  in
      s_need_one xs
  end;
