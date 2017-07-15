(* datatype binding，继 variable binding, function binding 之后第三种绑定 *)

(*
   1. 下面定义了一种新类型：mytype，该类型变量的值可以是 int * int 或者 string 或者 nothing；
   2. 每个值都有一个标签，用于鉴别该值是哪种类型变体，TwoInts Str Pizza 即为标签，称为 constructor；
   3. 每个变体的 constructor 类型可以相同，比如都可以是 int * int 类型；
   4. 该 datatype 在环境中添加四个元素：
     （1）一个类型 mytype
     （2）三个 constructor TwoInts Str Pizza
   5. constructor 的意义（二选一）：
     （1）创建 mytype 类型值的函数
     （2）本身就是 mytype 类型的值
   6. TwoInts 是 int * int -> mytype 类型的函数，Str 是 string -> int 类型的函数，Pizza 是 mytype 类型的值;
   7. constructor 可以用于 case 表达式中；
   8. 要创建 mytype 类型的值，有两种方式：（1）调用 constructor （2）直接使用 Pizza
*)
datatype mytype = TwoInts of int * int (* TwoInts 函数类型为：int * int -> mytype *)
		| Str of string
       | Pizza; (* Pizza 是 mytype 类型的值 *)

(*
   1. case 表达式类似 if-then-else，有两个表达式需要计算，第一个是 x，第二个是首次匹配的分支；
   2. 每个分支类型必须相同（类似 if-then-else）
   3. 分支形式为 p => e，p 为模式，e 为表达式；模式与表达式样子很类似，但完全不同，模式 p 用来匹配 x 的计算结果；
   4. case 表达式计算规则：
     （1）计算 x 表达式
     （2）用 x 的计算结果匹配各个模式（找到 x 是哪个变体构造出的，并将 x 携带的数据绑定到模式中对应部分）
     （3）首次匹配的模式后面的 e 表达式即为整个 case 表达式的计算结果；
   5. mytype 的所有变体（1）必须全部在 case 中列全（2）每个变体只能出现一次
p*)
fun f x = (* f 类型：mytype -> int *)
  case x of
      Pizza => 3
    | TwoInts(a, b) => a + b (* 若 x 为 TwoInts(3, 5)，则 3,5 分别被绑定到 a,b 上，可以用于右侧的 e 表达式中，且 3,5 的类型在 datatype binding 中已经确定 *)
    | Str s => String.size s;



	     
