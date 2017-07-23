(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
  s1 = s2;

fun len xs =
  case xs of
      [] => 0
    | _ :: xs' => 1 + len xs';

fun reverse xs =
  case xs of
      [] => []
    | x :: xs' => x :: reverse xs';


(* put your solutions for problem 1 here *)

(* 
   1. 
   s: 字符串
   slist：字符串 list（s 最多在 slist 中出现一次）
   result：若 s 不在 slist 中，结果为 NONE；否则结果为 SOME lst，其中 lst 为 slist 去掉 s 之后的列表
   example：
     all_except_option ("s", ["s", "a"]) = SOME ["a"]
     all_except_option ("s", ["a"]) = NONE
*)
fun all_except_option (s, slist) =
  let fun f (xs, ys) =
	case xs of
	    [] => ys
	  | x :: xs' => if same_string (x, s)
			then f(xs', ys)
			else f(xs', x :: ys)
  in
      let val ans = f (slist, [])
      in
	  if len ans = len slist
	  then NONE
	  else SOME ans
      end
  end;

(*
   2. val test2 = get_substitutions1 ([["foo"],["there"]], "foo") = [];
*)
fun get_substitutions1 (sll, s) =
  case sll of
      [] => []
    | x :: xs' => case all_except_option (s, x) of
		      NONE => []
		    | SOME i => i @ get_substitutions1 (xs', s);

(*
   3. 与 get_substitutions1 功能相同，但用尾递归实现
*)
fun get_substitutions2 (sll, s) =
  let fun aux (sll, acc) =
	case sll of
	    [] => acc
	  | x :: xs' => case all_except_option (s, x) of
			    NONE => aux(xs', acc)
			  | SOME i => aux (xs', i @ acc)
  in
      aux(sll, [])
  end;

(*
   4. 
*)
fun similar_names (sll, name) =
  let val {first = f, middle = m, last = l} = name
      fun aux xs =
	case xs of
	    [] => []
	  | x :: xs' => {first = x, middle = m, last = l} :: aux xs'
  in
      name :: aux (get_substitutions2 (sll, f))
  end;

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades;
datatype rank = Jack | Queen | King | Ace | Num of int;
type card = suit * rank;

datatype color = Red | Black;
datatype move = Discard of card | Draw;

exception IllegalMove;

(* put your solutions for problem 2 here *)

(* 5 *)
fun card_color card =
  case card of
      (Clubs, _) => Black
    | (Spades, _) => Black
    | _ => Red;

(* 6 *)
fun card_value card =
  case card of
      (_, Num n) => n
    | (_, Ace) => 11
    | _ => 10;

(* 7 *)
fun remove_card (cs, c, e) =
  let fun aux (cs, acc) =
	case cs of
	    [] => acc
	  | x :: cs' => aux (cs', if c = x then acc else x :: acc)
  in
      let val result = aux (cs, [])
      in
	  if len cs = len result
	  then raise e
	  else result
      end
  end;

(* 8 *)
fun all_same_color cards =
  case cards of
      x :: y :: xs' => card_color x = card_color y andalso all_same_color (y :: xs') (* y :: xs' *)
    | _ => true;

(* 9 *)
fun sum_cards cards =
  let fun aux (xs, acc) =
	case xs of
	    [] => acc
	  | x :: xs' => aux (xs', card_value x + acc)
  in
      aux (cards, 0)
  end;

(* 10 *)
fun score (cards, goal) =
  let val sum = sum_cards cards
      val pre_score = if sum > goal then 3 * (sum - goal) else goal - sum
  in
      if all_same_color cards
      then pre_score div 2
      else pre_score
  end;

(* 11 *)
fun officiate (cards, moves, goal) =
  let fun go (cards, held_cards, moves) =
	case (cards, held_cards,  moves) of
	    (cards, held_cards, []) =>  score (held_cards, goal) (* moves 为空，结束 *)
	  | (cards, held_cards, Discard c :: moves') => go (cards, remove_card (held_cards, c, IllegalMove),  moves') (* 执行 Discard *)
	  | ([], held_cards, Draw :: moves') => score (held_cards, goal) (* 下一步为 Draw，但 cards 已经为空 *)
	  | (c :: cards', held_cards, Draw :: moves') => let val s = score (c :: held_cards, goal) (* 执行 Draw *)
							 in
							     if s > goal
							     then s
							     else go (cards', c :: held_cards,  moves')
							 end
  in
      go (cards, [], moves)
  end;
