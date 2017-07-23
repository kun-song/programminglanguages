datatype suit = Club | Diamond | Heart | Spade;

datatype rank = Jack | Queen | King | Ace | Num of int;

type card = suit * rank;

type name_record = { student_num : int option, 
                     first       : string, 
                     middle      : string option, 
                     last        : string };

fun is_Queen_of_Spade(c: card) = (* REPL 打印 card -> bool *)
  if #1 c = Spade andalso #2 c = Queen
  then true
  else false;

(* 使用 case 时，无需指定参数 c 的类型 *)
fun is_Queen_of_Spade2 c = (* REPL 打印 suit * rank -> bool *)
  case c of
      (Spade, Queen) => true
    | _ => false;

val result = is_Queen_of_Spade (Spade, Queen);
val result = is_Queen_of_Spade2 (Spade, Queen);
