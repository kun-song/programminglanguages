(* ADT 与 OOP 中的类很相似 *)

(* 不能使用 type 定义，因为 type 不能递归 *)
datatype set = S of {insert: int -> set,
		     member: int -> bool,
		     size: unit -> int};

(* 对外暴露只有 3 个闭包，xs contains 都是私有的 *)
val empty_set =
    let fun make_set xs = (* private field *)
	  let
	      fun contains i = List.exists (fn j => i = j) xs (* private method *)
	  in
	      S {
		  insert = fn i =>
			      if contains i
			      then make_set xs       (* recursive *)
			      else make_set (i::xs), (* recursive *)
		  member = contains,
		  size   = fn () => length xs
	      }
	  end
    in
	make_set []
    end;

(* test cases *)
val S s = empty_set;
val S s1 = (#insert s) 19;
val S s2 = (#insert s1) 20;
val S s2 = (#insert s2) 20; (* 19, 20；重复添加无效 *)

val test1 = (#member s2) 19 = true;
val test2 = (#member s2) 20 = true;
val test3 = (#size s2) () = 2;
