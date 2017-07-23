(* currying + partial appliation 有时会产生 type vars not generalized 警告 *)

(* type vars not generalized 警告 *)

val pairWithOne = List.map (fn x => (x, 1));

fun pairWithOne1 xs = List.map (fn x => (x, 1)) xs;

val pairWithOne2: string list -> (string * int) list = List.map (fn x => (x, 1));

(* test cases *)

val test1 = pairWithOne1 [1,2,3] = [(1,1),(2,1),(3,1)];
val test2 = pairWithOne2 ["a", "b", "c"] = [("a",1),("b",1),("c",1)];
