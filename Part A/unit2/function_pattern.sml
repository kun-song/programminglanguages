(*
   fun f p1 = e1
     | f f p2 = e2
   ...
*)

fun append ([], ys) = ys
  | append (x :: xs, ys) = x :: append (xs, ys);

val result = append ([], [1,2,3]) = [1,2,3];
val result = append ([1,2,3], [4,5,6]) = [1,2,3,4,5,6];
