(* Homework Assigment 3: OCaml Finger Exercises Continued! *)

(* The following command tells OCaml to use the "assert" library that
   defines the run_test command used below. *)
;; open Assert

(* The assertion library by default will run _all_ of the test cases
   associated with this program.  However, while debugging you
   may prefer to have the testing stop on the first failure that
   is encountered. The command below requests this behavior.
   Remove or comment out the line to see all of the test errors at once. *)

;; stop_on_failure ()

(* NOTE: you should _not_ use functions built into OCaml, especially the ones in
   the List module, except where they are explicitly allowed in the comments.
   The purpose of this assignment is to familiarize you with the basics of OCaml
   programming, so we want you to explicitly write out each of these problems
   even though there is often a built-in function that would achieve the same
   result. You will not receive credit for solutions that are contrary to the
   spirit of the assignment. *)

(*************************************************************************)
(* Problem 5 (exists) *)

(* Write a function that determines whether at least one boolean value
   in its input list is true. *)

let rec exists (bools: bool list) : bool =
  begin match bools with
        | [] -> false
        | hd :: tl -> hd = true || exists tl
        end

(* The `not` function below takes in a boolean value and returns its
   complement *)
let test () : bool =
  not (exists [false; false])
;; run_test "exists all false" test

let test () : bool =
  (exists [true; false; true])
;; run_test "exists multiple true" test

let test () : bool =
  (exists [true; true])
;; run_test "exists all true" test

let test () : bool =
  (exists [false; false; true; false])
;; run_test "exists most false" test


(*************************************************************************)
(* Problem 6 (join) *)

(* Write a function that takes a list of strings and "flattens" it
   into a single string. Your function should also take an additional
   argument, a separator string, which is interspersed between all of
   the strings in the list.
  
   Hint: the ^ operator concatenates two strings together. For example,
   `"a" ^ "bc"` evaluates to "abc". *)

let rec join (separator: string) (l: string list) : string =
  begin match l with
        | [] -> ""
        | hd::[] -> hd ^ join separator []
        | hd::tl -> hd ^ separator ^ join separator tl
        end

let test () : bool =
  (join "," ["a"; "b"; "c"]) = "a,b,c"
;; run_test "test_join nonempty separator" test

let test () : bool =
  (join "" ["a"; "b"; "c"]) =  "abc"
;; run_test "test_join empty separator" test

let test () : bool =
  (join ":" ["a"; "b"; "c"]) =  "a:b:c"
;; run_test "test_join nonempty separator 2" test

let test () : bool =
  (join "+" ["a"; "b"; "c"]) =  "a+b+c"
;; run_test "test_join nonempty separator 3" test


(*************************************************************************)
(* Example (printing lists) *)

;; print_endline "~~~~~~~~~~~~~~~~~~~~~~~~"
;; print_endline "Start of list printing example"

(* Once you have implemented the `join` function above, you can use it
   to print out lists of strings. This can be very useful for
   debugging the remaining tasks in this assignment, as you can print
   out the output of your functions to help you understand why your
   test cases are failing *)

(*
;; print_endline (join "," ["a"; "b"; "c"])
*)

(* If you would like to print a list of `int`s, you'll need a variant
   of the `join` function for this purpose. We advise that you go
   ahead and do this so that you can use this function to help debug
   the last few tasks in this homework. *)

let rec int_join (separator: string) (l: int list) : string =
    begin match l with
        | [] -> ""
        | hd::[] -> (string_of_int hd) ^ (int_join separator [])
        | hd::tl -> (string_of_int hd) ^ separator ^ (int_join separator tl)
        end

;; print_endline ("[" ^ (int_join ";" [1; 2; 3]) ^ "]")


;; print_endline "End of list printing example"
;; print_endline "~~~~~~~~~~~~~~~~~~~~~~~~"

(*************************************************************************)
(* Problem 7 (append) *)

(* Write a function that takes lists l1 and l2 and returns a list
   containing all the items in l1 followed by all the items in l2.
  
   NOTE: OCaml actually already provides this function. In future
   homeworks you can use built in operator `@`, which appends l1 and l2
   as in l1 @ l2. Do *not* use the @ operator in your solution to this
   problem. *)

let rec append (l1: string list) (l2: string list) : string list =
  begin match l1, l2 with
      | [], [] -> []
      | hd1::tl1, _ -> hd1::append tl1 l2
      | [], hd2::tl2 -> hd2::append l1 tl2
      end

let test () : bool =
  (append [] []) = []
;; run_test "append two empty lists" test

let test () : bool =
  (append ["1"; "2"] ["3"]) = ["1"; "2"; "3"]
;; run_test "append different lengths" test

let test () : bool =
  (append [] ["3"]) = ["3"]
;; run_test "append empty list then list" test

let test () : bool =
  (append ["3"; "6"; "8"] []) = ["3"; "6"; "8"]
;; run_test "append list then empty list" test


(*************************************************************************)
(* Problem 8 (finding names in a list) *)

(* Write a function that checks whether a list of names contains some
   particular name. *)

let rec contains_str (l: string list) (name: string) : bool =
    begin match l with
    | [] -> false
    | hd::tl -> if hd = name then true else contains_str tl name
    end

let test () : bool =
  (contains_str ["Garnet"; "Amethyst"; "Pearl"] "Amethyst")
;; run_test "contains_str name in list once" test

let test () : bool =
  not (contains_str ["Garnet"; "Amethyst"; "Pearl"] "Steven")
;; run_test "contains_str name not in list" test

let test () : bool =
  not (contains_str ["Garnet"; "Amethyst"; "Pearl"] "Peridot")
  ;; run_test "contains name not in list" test

let test () : bool =
  (contains_str ["Garnet"; "Amethyst"; "Pearl"; "Rose Quartz"] "Rose Quartz")
;; run_test "contains name in list" test


(* Next, write a function that, given two lists of names, filters the
   first list so that only those that are also in the second list
   remain. That is, your function should return a list containing all
   the elements that appear in both lists, in the order that they
   appear in the first list. *)

let rec in_both (names1: string list) (names2: string list) : string list =
    begin match names1, names2 with
    | [], _ -> []
    | _, [] -> []
    | hd::tl, names2 -> if (contains_str names2 hd) then hd::(in_both tl names2) else (in_both tl names2)
    end

let test () : bool =
  (in_both ["Garnet"; "Amethyst"; "Pearl"] ["Pearl"; "Steven"]) = ["Pearl"]
;; run_test "in_both Pearl in both lists" test

let test () : bool =
  (in_both [] ["Pearl"; "Steven"]) = []
;; run_test "in_both empty name list" test

let test () : bool =
  (in_both ["Garnet"; "Amethyst"] ["Pearl"; "Steven"]) = []
;; run_test "in_both only one" test

let test () : bool =
  (in_both ["Garnet"] ["Pearl"; "Steven"]) = []
;; run_test "in_both only one" test


(*************************************************************************)
(* Problem 9 (rainfall) *)

(* Design and implement a function called `rainfall` that consumes a
   list of ints representing daily rainfall readings. The list may
   contain the number -999 indicating the end of the data of interest.
  
   Produce the average of the non-negative values in the list up to the first
   -999 (if it shows up). There may be negative numbers other
   than -999 in the list, representing faulty readings; these should
   be skipped.  If you cannot compute an average, for whatever reason,
   return -1.  *)
      
  let rainfall (readings: int list) : int = 
    let rec sum_rfs readings = 
      match readings with
      | [] -> 0
      | h :: t ->
          if h = -999 then 0
          else if h < 0 then sum_rfs t
          else h + sum_rfs t
    in
    let rec count_days readings = 
      match readings with
      | [] -> 0
      | h :: t ->
          if h = -999 then 0
          else if h < 0 then count_days t
          else 1 + count_days t
    in 
    let total = sum_rfs readings in
    let days = count_days readings in
    total / days 

(* For example, if we have three readings, then the average rainfall
   is (1 + 2 + 3) / 3 = 6/3 = 2 *)
let test () : bool =
  rainfall [ 1; 2; 3 ] = 2
;; run_test "example" test

(* NOTE: for simplicity, you should only use int operations in this
   problem.  (This may lead to slightly wrong answers, as integer
   division discards the fractional part of its result instead of
   rounding.) *)

let test () : bool =
  rainfall [ 2; 2; 2; 2; 1] = 1
;; run_test "use integer division to calculate average" test

(* HINT: Before you implement this function, make sure that you add
   more test cases. The two tests above do not cover all of the
   situations in the problem description. *)

let test () : bool =
  rainfall [ 1; 2; 3; -999 ] = 2
;; run_test "example with negative" test

let test () : bool =
  rainfall [ 1; 2; 3; 4; 5 ] = 3
;; run_test "example" test

let test () : bool =
  rainfall [ 1; -2; -3; 3; 5 ] = 3
;; run_test "example with negatives" test

(* The last part of this file is a print statement. When you see this
   line after running your code, you will know that all of the tests
   in this file have succeeded. *)
;; print_endline "intro.ml: ran to completion"
