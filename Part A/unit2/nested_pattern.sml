
exception ListLengthException;

(*  'a list * 'b list * 'c list -> ('a * 'b * 'c) list *)
fun zip3 list_triple =
  case list_triple of
      ([], [], []) => []
   |  (hd1 :: tl1, hd2 :: tl2, hd3 :: tl3) => (hd1, hd2, hd3) :: zip3 (tl1, tl2, tl3) (* noempty list *)
   | _ => raise ListLengthException;

val result = zip3 ([1, 2, 3 ], [4, 5, 6], [7, 8, 9]) = [(1,4,7),(2,5,8),(3,6,9)];

(* ('a * 'b * 'c) list -> 'a list * 'b list * 'c list *)
fun unzip3 tlist =
  case tlist of
      [] => ([], [], [])
    | (a, b, c) :: tl => let val (x, y, z) = unzip3 tl
			 in
			     (a :: x, b :: y, c :: z)
			 end;

val result = unzip3 [(1,4,7),(2,5,8),(3,6,9)] = ([1, 2, 3 ], [4, 5, 6], [7, 8, 9]);

fun nondecreasing intlist =
  case intlist of
      x :: y :: tl => x <= y andalso nondecreasing (y :: tl)
    | _ => true;

val result = nondecreasing [1, 2, 3, 3, 4] = true;
val result = nondecreasing [1, 2, 2, 3, 2] = false;

datatype sign = P | N | Z;

fun multsign (x, y) =
  let fun sign x = if x = 0 then Z else if x > 0 then P else N
  in
      case (sign x, sign y) of
	  (_, Z) => Z
	| (Z, _) => Z
	| (P, N) => N
	| (N, P) => N
	| _ => N
(*	| (P, P) => P
	| (N, N) => P *)
  end;
