(*
   1. append 类型为 'a list * 'a list -> 'a list
   2. xs ys 可以是任意 list，但必须是相同的 list
*)
fun append (xs, ys) =
  case xs of
      [] => ys
    | x :: xs' => x :: append (xs', ys);

(*
   1. 函数类型为 ''a * ''b -> string
   2. ''a ''b 必须为 Equality Type
*)
fun same_thing (x, y) =
  if x = y then "yes" else "no";
