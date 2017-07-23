
fun double x = x + x;
fun incr x = x + 1;

(*
   1. function is value.
   2. double incr 都是函数，与普通值并没有区别，所以可以出现在任何 value 可以出现的地方；
   3. a_tuple 的类型为：(int -> int) * (int -> int) * int
*)
val a_tupe = (double, incr, double (incr 7));

(*
   1. 提取 a_tuple 中保存的 function，并调用该函数
*)
val eighteen = #1 a_tupe 9;
