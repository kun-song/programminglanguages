
(*
   类型推断过程：

   1. f 类型为 T1 -> T2
   2. x : T1
   3. y : T3
   4. z : T4
   5. T1 : T3 * T4 [(y, z) = x]
   6. T3 : int [abs int -> int]
   7. T4 : int
   
   f 类型为：int -> int 
*)

fun f x =
  let val (y, z) = x
  in
      (abs y) + z
  end;


