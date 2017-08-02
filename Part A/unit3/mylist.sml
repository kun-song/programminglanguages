
datatype 'a mylist = Empty
		 | Cons of 'a * ('a mylist);

fun map f xs = (* curry *)
  case xs of
      Empty => Empty
    | Cons(x, xs') => Cons(f x, map f xs');

fun filter f xs = (* curry *)
  case xs of
      Empty => Empty
    | Cons(x, xs') => if f x then Cons(x, filter f xs') else filter f xs';

fun length xs =
  case xs of
      Empty => 0
    | Cons(_, xs') => 1 + length xs';


(* test cases *)

val doubleAll = map (fn x => x * 2);
fun countNs (xs, n: int) = length (filter (fn x => x = n) xs);

val mlist = Cons(1, Cons(2, Cons(3, Empty)));
val test1 = length mlist = 3;
val test2 = countNs (mlist, 2) = 1;

val mlist2 = doubleAll mlist;
val test3 = countNs (mlist2, 6) = 1;
