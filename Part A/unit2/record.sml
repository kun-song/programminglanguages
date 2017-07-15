
(* 
   1. 下面的是 record 表达式，该表达式的值为 {bar = (3, false), foo = 7, baz = (true, 9)}，类型为 {foo: int * boo, foo: int, baz: bool * int}；
   2. 字段名顺序不影响类型，所以 {a: int, b: boo} 与 {b: bool, a: int} 是相同类型；
   3. 访问字段值：#foo e
*)
val re = {bar = (1+2, true andalso false), foo = 3 + 4, baz = (true, 9)};

val bar = #bar re;
val foo = #foo re;
val baz = #baz re;

(*
   1. tuple 是 record 的语法糖，语法与 record 不同，但语义与 record 完全相同；
   2. tuple 基于位置访问元素 vs record 基于字段名访问元素
   3. tuple 的位置 1, 2, 3, ... 实际就是 record 的字段名 1, 2, 3, ...
*)
val tu = (9, false, (true, 100));
val first = #1 tu;
val second = #2 tu;
val third = #3 tu;
