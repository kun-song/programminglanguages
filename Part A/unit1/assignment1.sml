
(* date: int * int * int, year, month, day *)

(* 1 *)
fun is_older(date1: int * int * int, date2: int * int * int) =
  if #1 date1 < #2 date2
  then true
  else
      if #2 date1 < #2 date2
      then true
      else
	  if #3 date1 < #3 date2
	  then true
	  else false;

(* 2 *)
fun number_in_month(dates: (int * int * int) list, month: int) =
  if null dates
  then 0
  else
      let val tl_ans = number_in_month(tl dates, month)
      in
	  if #2 (hd dates) = month
	  then 1 + tl_ans
	  else tl_ans
      end;

(* 3 *)
fun number_in_months(dates: (int * int * int) list, months: int list) =
  if null months
  then 0
  else number_in_month(dates, hd months) + number_in_months(dates, tl months);

(* 4 *)
fun dates_in_month(dates: (int * int * int) list, month: int) =
  if null dates
  then []
  else
      let val tl_ans = dates_in_month(tl dates, month)
      in
	  if #2 (hd dates) = month
	  then hd dates :: tl_ans
	  else tl_ans
      end;

