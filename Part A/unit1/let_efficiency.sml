(* [5, 4, 3, 2, 1] *)
fun countdown(from: int, to: int) =
  if from = to
  then to :: []
  else from :: countdown(from - 1, to);

(* [1, 2, 3, 4, 5] *)
fun countup(from: int, to: int) =
  if from = to
  then to :: []
  else from :: countup(from + 1, to);

(*
   1. bad_max 在 list 为递减列表时，效率很高，为 O(n)
   2. bad_max 在 list 为递增列表时，效率迅速下降，为 O(2^n)
*)
fun bad_max(xs: int list) =
  if null xs
  then 0 (* 坏风格，以后修正 *)
  else
      if hd xs > bad_max(tl xs) (* 1 *)
      then hd xs
      else bad_max(tl xs); (* 2 *)

(*
   1. 通过 let 表达式定义局部绑定，减少重复递归调用，时间复杂度提升为 O(n)
*)
fun better_max(xs: int list) =
  if null xs
  then 0
  else
      let val tl_ans = better_max(tl xs)
      in
	  if hd xs > tl_ans
	  then hd xs
	  else tl_ans
      end;
