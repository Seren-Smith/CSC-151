;; open Assert

(* For all the problems in this homework, it is possible to write a
 * function that uses structural recursion to accomplish the goal.
 * However, to receive credit on this assignment you must instead
 * rely on one of the HOF functions given below to carry out the
 * task.  By giving it an appropriately crafted function as input
 * you should be able to achieve the goal without writing any 
 * recursive functions yourself. *)

(***********************)
(* HOF Implementations *)
(***********************)

(* Leave these functions as they are written.  
 * You will use them in the exercises below. *)

(* Modify each element of a list using the provided function *)
let rec transform (f: 'a -> 'b) (l: 'a list) : 'b list =
  begin match l with
  | [] -> []
  | hd :: tl -> (f hd) :: (transform f tl)
  end

(* Filter elements from a list using the provided funtion *)
let rec filter (pred: 'a -> bool) (l: 'a list) : 'a list =
  begin match l with
  | [] -> []
  | hd :: tl -> if pred hd then hd :: (filter pred tl) else filter pred tl
  end

(* Accumulate a result across a list, using the provided base and accumulator *)
let rec fold (combine: 'a -> 'b -> 'b) (base:'b) (l : 'a list) : 'b = 
   begin match l with 
   | [] -> base
   | x :: t -> combine x (fold combine base t)
   end

(*******************)
(* Filter Problems *)
(*******************)

(* Given a list of integers, filters out all zeros. *)
(* This one is completed as an example. *)
let filter_zeros (l: int list) : int list = 
  filter (fun x -> x <> 0) l	

let test () : bool =
  filter_zeros [0;1;2;3;0] = [1;2;3]
;; run_test "zero filter" test

let test () : bool =
  filter_zeros [1;2;3] = [1;2;3]
;; run_test "zero filter no zeros" test

let test () : bool =
  filter_zeros [] = []
;; run_test "zero filter empty" test

let test () : bool =
  filter_zeros [0;0] = []
;; run_test "zeros only filter" test

(* PROBLEM 1 *)
(* Write a function that, given a list of lists, returns a list of lists with
 * all of the empty lists filtered out. *)
(* Begin by defining tests that your function should pass. *)
let filter_empties (l: 'a list list) : 'a list list = 
  filter (fun x -> x <> []) l

let test () : bool = 
  filter_empties [[2]; []; [4]] = [[2]; [4]]
;; run_test "filter_empties one empty" test

let test () : bool = 
  filter_empties [[4]; [5]] = [[4]; [5]]
;; run_test "filter_empties no empty" test

let test () : bool = 
  filter_empties [[]; [1;2]; [4]; []] = [[1;2]; [4]]
;; run_test "filter_empties multiple empty" test

(* PROBLEM 2 *)
(* Write a function that takes an int [i], and returns a _function_ that will take an 
 * input list and filter out all instances of [i] from the list. *)
(* Begin by defining tests that your function should pass. *)
  
let get_int_filterer (i: int) : int list -> int list = 
  filter (fun x -> x <> i)
  
let test () : bool = 
  get_int_filterer 1 [0;1;2] = [0;2]
;; run_test "take out one 1" test

let test () : bool = 
  get_int_filterer 1 [0;1;2;1;1;0] = [0;2;0]
;; run_test "take out multiple 1s" test

let test () : bool = 
  get_int_filterer 2 [0;1;2] = [0;1]
;; run_test "take out one 2" test

(**********************)
(* Transform Problems *)
(**********************)

(* Write a function that takes a list of integers [l] and converts it to a list 
 * of strings where each string represents the corresponding integer from 
 * the input list. 
 *
 * e.g. transform_ints_to_strings [1;2;3] = ["1"; "2"; "3"]
 *)
(* Begin by defining tests that your function should pass. *)
(* This one is completed as an example. *)
let transform_ints_to_strings (l: int list) : string list =
  transform (fun i -> string_of_int i) l

let test () : bool =
  transform_ints_to_strings [1;2;3;4;5] = ["1";"2";"3";"4";"5"]
;; run_test "transform_ints_to_strings" test

let test () : bool =
  transform_ints_to_strings [-7] = ["-7"]
;; run_test "transform_ints_to_strings singleton negative" test

let test () : bool =
  transform_ints_to_strings [] = []
;; run_test "transform_ints_to_strings empty" test


(* PROBLEM 3 *)
(* Write a function that takes a list of integers [l] and negates
 * all negative integers in the list. *)
(* Begin by defining tests that your function should pass. *)
let negate_negatives (l : int list) : int list =
  transform (fun i -> abs(i)) l

  let test () : bool =
    negate_negatives [-7] = [7]
  ;; run_test "negate_negatives one negative" test

  let test () : bool = 
    negate_negatives [-1; 2; -5] = [1; 2; 5]
  ;; run_test "negate_negatives two negatives" test

  let test () : bool = 
    negate_negatives [6; 9; 2] = [6; 9; 2]
  ;; run_test "negate_negatives no negatives" test

  let test () : bool = 
    negate_negatives [] = []
  ;; run_test "negate_negatives empty" test

(**********************)
(*    Fold Problems   *)
(**********************)

(* Write a function that counts the total number of characters 
 * in a list of strings
 *
 * e.g. count_all_characters ["I";"am";"happy"] = 8
 *)
(* Begin by defining tests that your function should pass. *)
(* This one is completed as an example. *)

let count_all_characters (sl: string list) : int =
  fold (fun s count -> count + String.length s) 0 sl

let test () : bool =
  count_all_characters ["I";"am";"happy"] = 8
;; run_test "count_all_characters" test

let test () : bool =
  count_all_characters ["I am happy!"] = 11
;; run_test "count_all_characters single string" test

let test () : bool =
  count_all_characters ["";""] = 0
;; run_test "count_all_characters empty strings" test

let test () : bool =
  count_all_characters [] = 0
;; run_test "count_all_characters empty list" test

(* PROBLEM 4 *)
(* Write a function that takes a list of integers [l] and produces a 
 * single string that concatenates all their string representations
 * together.  (If all the ints in the list are single digits, this 
 * might be used to represent a very long number, for example.)
 *
 * e.g. string_of_int_list [1;3;3;7] = "1337"
 *)

(* Begin by defining tests that your function should pass. *)

let string_of_int_list (l : int list) : string =
  fold (fun x base -> string_of_int x ^ base) "" l

let test () : bool = 
  string_of_int_list [1;2;3;4] = "1234"
;; run_test "four digit" test

let test () : bool = 
  string_of_int_list [1;4] = "14"
;; run_test "two digit" test

let test () : bool = 
  string_of_int_list [] = ""
;; run_test "empty test" test

(************************)
(* Combination Problems *)
(************************)

(* PROBLEM 5 *)
(* Write a function that, given a list of lists of integers, returns a list of 
 * list of integers with all of the negative integers removed
 *
 * e.g. filter_negatives [[1; -2]; [-1; -1]; [1; 2]] = [[1]; []; [1; 2]]
 *)
(* Begin by defining tests that your function should pass. *)
let no_negs (l: int list) : int list = 
  filter (fun x -> x >= 0) l

let filter_negatives (l: int list list) : int list list = 
  transform (fun i -> no_negs i) l 

let test () : bool = 
  filter_negatives [[-1;4];[1]] = [[4];[1]]
;; run_test "remove negatives" test

let test () : bool = 
  filter_negatives [[-1];[1]] = [[];[1]]
;; run_test "remove negatives with an empty" test

let test () : bool = 
  filter_negatives [[-1;3];[5];[-9]] = [[3];[5];[]]
;; run_test "remove negatives with another empty" test

(* KUDOS PROBLEM:  not required; not for credit *)
(* Write a function that, given a list of lists of integers, returns a list of lists
 * where each sub-list has had all instances of the first element of the list filtered out.
 * You may assume that all the sub-lists are non-empty (fail if one is not).
 *
 * The [get_int_filterer] function you wrote above may be useful.
 *
 * e.g. filter_heads [[1;1;2]; [3;1;3;2]] = [[2]; [1;2]]
 *)
(* Begin by defining tests that your function should pass. *)
let filter_heads (l: int list list) : int list list = 
  filter (fun x -> x <> i)

  (*Ran out of time.*)