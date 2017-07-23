fun filter (f, xs) =
  case xs of
      [] => []
    | x :: xs' => if f x
		  then x :: filter (f, xs')
		  else filter (f, xs');

fun greaterThanX x = fn y => y > x;

val noNegatives = filter (greaterThanX ~1, [1,2,3,~3]) = [1,2,3];

fun greaterThan (xs, n) = filter (fn x => x > n, xs);

val noNegatives = greaterThan ([1,2,3,~3], ~1) = [1,2,3];
