(* value restriction : only in variable bindings *)

val r = ref NONE;

(*
val _ = r := SOME "hi";
val i = 1 + ValOf(!r);
*)

val f = List.map (fn x => (x, 1));

val f1: int list -> (int * int) list = List.map (fn x => (x, 1));

(* 使用 function-binding 替代 variable-binding *)
fun f2 xs = List.map (fn x => (x, 1)) xs;
