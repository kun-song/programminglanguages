(* 回调函数列表 *)
val cbs : (int -> unit) list ref = ref [];

(* 回调注册 *)
fun onKeyEvent f = cbs := f :: (!cbs);

(* 事件产生，遍历回调函数列表，调用所有 *)
fun onEvent i =
  let fun loop fs =
	case fs of
	    [] => ()
	  | f :: fs' => (f i; loop fs')
  in
      loop (!cbs)
  end;

(* timesPressed 用于记录回调函数被调用的次数 *)
val timesPressed = ref 0;

(* 注册 1 个回调函数 *)
val _ = onKeyEvent (fn _ => timesPressed := (!timesPressed) + 1);

(* 封装了注册函数 *)
fun printIfPressed i = onKeyEvent (fn j => if i = j then print ("has been pressed: " ^ Int.toString j ^ "\n") else ());

(* 注册 3 个回调函数 *)
val _ = printIfPressed 1;
val _ = printIfPressed 5; (* 对 5 有两个回调函数，因此若事件 5 发生，则会打印两次 *)
val _ = printIfPressed 5;
val _ = printIfPressed 11;

(* 模拟事件发生 *)
val _ = onEvent 1;
val _ = onEvent 2;
val _ = onEvent 3;
val _ = onEvent 5;
val _ = onEvent 11;
val _ = onEvent 100;

(* 每个回调函数被调用 5 次 *)
val test = (!timesPressed) = 6;
