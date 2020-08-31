(* Homework Assigment 1: OCaml Finger Exercises! *)

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
(* Problem 1 (counting coins) *)

(* Your job in this problem is to calculate the smallest number of
   pennies, nickels, and dimes that can be used to add up to the given
   amount. For example, to make 7 cents, a total of 3 coins are
   needed (two pennies and a nickel); to make 99 cents, 14 coins are
   needed (9 dimes, 1 nickel, and 4 pennies).
  
   First, have a look at our tests (just below the definition of the
   coins function), make sure you understand them, and fill in two
   more tests of your own.
  
   Then come back and fill in the body of the function `coins` below
   so that it returns the right answers on all the tests. (Start by
   deleting the line beginning `failwith`.) *)

let rec coins (amount: int) : int =
  let dimes = amount / 10 in
  let nickels = (amount - dimes * 10) / 5 in
  let pennies = ((amount - dimes * 10) - nickels * 5) in
  dimes + nickels + pennies

(* Here are two test cases for this problem. *)

let test () : bool =
  (coins 7) = 3
;; run_test "coins nickels and pennies" test

let test () : bool =
  (coins 99) = 14
;; run_test "coins dimes, nickels, and pennies" test

(* Here are two more test case stubs. Please edit them to produce real
   tests for the coins function. For each of the problems in the
   assignment, we provide some test cases like the ones above.
   However, just because your code passes the given tests does not
   mean that you will get full credit. When you submit your
   assignment, we will test it using DIFFERENT tests from the ones
   above. To make sure that your solution is robust enough to pass our
   tests, you should think about what tests you can add to make sure
   that your program is correct.
  
   STARTING FROM THE NEXT HOMEWORK, YOUR GRADE WILL DEPEND ON THE QUALITY 
   AND ROBUSTNESS OF YOUR TEST CASES AS PART OF YOUR "STYLE GRADE."
  
   Please refer to the FAQ page for an explanation about test cases. *)

let test () : bool =
  (coins 20) = 2
;; run_test "coins dimes" test

let test () : bool =
  (coins 4) = 4
;; run_test "coins pennies" test


(*************************************************************************)
(* Example (printing) *)

(* Printing is a useful tool, letting you see the output of your code
   on the console. In this part, we will show you how to print in
   OCaml. *)

(* Recall that OCaml files are composed of top-level definitions,
   which begin with the `let` keyword, and commands, which begin with
   two semicolons. One useful command instructs OCaml to print
   text. *)

(* The `print_endline` function causes its string argument to appear in the
   output window (much like `System.out.println` in Java). *)

;; print_endline "~~~~~~~~~~~~~~~~~~~~~~~~~"
;; print_endline "Start of printing example"

(* Adding commands to print values can be very useful for debugging
   your assignment. For example, consider the following buggy
   function: *)

let day_after (day: string) : string =
  begin match day with
  | "Monday"    -> "Tuesday"
  | "Tuesday"   -> "Wednesday"
  | "Wednesday" -> "Thursday"
  | "Thursday"  -> "Friday"
  | "Friday"    -> "Saturday"
  | "Saturday"  -> "Sunday"
  | "Sunday"    -> "Monday"
  | _           -> failwith "not a valid day"
  end

(* The following test case for this definition fails, telling us that
   this definition definitely has a bug (since the test case matches
   our understanding of what the function is supposed to do). But
   running the program just tells us that the answer is wrong, without
   showing the actual answer. *)

let test () : bool =
  (day_after "Tuesday") = "Wednesday"
;; run_test "day_after Tuesday" test

(* Adding a print command will let us see what the erroneous result
   actually is.

   Try moving the `print_endline` command from the line below to
   before the failing test case (so that its output is displayed
   before the test fails); then run your code again. *)


(* (After running this example, go ahead and fix the bug in the
   `day_after` function so that the test passes). *)

(* Note: If the result that you want to print is not a string, you
   need to convert it to be a string. OCaml includes some library
   functions to do this, such as `string_of_int` and `string_of_bool`.
  
   After you finish problem 1 above, uncomment the next command
   to demonstrate printing integer values. *)

(*
;; print_endline ("Coins to make 99 cents is "
               ^ (string_of_int (coins 99)))
*)

(* Feel free to add whatever printing commands you like to this
   homework assignment. The testing infrastructure will ignore any
   output that your code produces. *)

;; print_endline "End of printing example"
;; print_endline "~~~~~~~~~~~~~~~~~~~~~~~"


(*************************************************************************)
(* Problem 2 (geometry) *)

(* Street magicians often use crates as tables in their acts.  Given
   the dimensions of a crate, your job in this part is to find the
   largest surface area it can provide when used as a table.
  
   Hint: OCaml provides built-in max and min functions that take in
   two arguments and behave exactly as you might expect: `max 5 2`
   returns 5, for example.  The problem can be solved using just max,
   min, and simple arithmetic.
  
   The function's behavior when one or more of the input side lengths
   is zero or negative is not important. Your maximum_table_area
   function may return any value in such cases; we will not test them.
  
   Once again, you should look at our test cases first, then add your
   own test cases, and THEN come back and implement maximum_table_area. *)

let rec maximum_table_area (side1: int) (side2: int) (side3: int) : int =
  let comp1 = side1 * side2 in
  let comp2 = side1 * side3 in
  let comp3 = side2 * side3 in
  let max1 = 
    if comp1 >= comp2 then comp1 else comp2 in
    let max2 = if comp3 >= max1 then comp3 else max1 in
    let total_max = 
      if max1 >= max2 then max1 else max2 in total_max

let test () : bool =
  (maximum_table_area 1 2 3) = 6
;; run_test "maximum_table_area three different side lengths" test

let test () : bool =
  (maximum_table_area 4 3 3) = 12
;; run_test "maximum_table_area two sides the same length" test

let test () : bool =
  (maximum_table_area 1 5 5) = 25
  ;; run_test "maximum_table_area two sides same length" test

let test () : bool =
  (maximum_table_area 3 3 3) = 9
  ;; run_test "maximum_table_area three sides the same length" test

(*************************************************************************)
(* Problem 3 (simulating robot movement) *)

(* Help a robot move along a (linear) track, with spaces numbered 0
   through 99, by calculating its new position when given `dir` (a
   string that will be either "forward" or "backward") and `num_moves`
   indicating a (non-negative) number of spaces.  Keep in mind that
   the robot can't move past the 0 or 99 spot, so when it reaches
   either end it stays there. *)

let rec move_robot (pos: int) (dir: string) (num_moves: int) : int =
  let new_pos = 
    if dir = "forward" then (pos + num_moves) else (pos - num_moves) in
    let valid_pos = 
      if new_pos < 0 then 0 else if new_pos > 99 then 99 else new_pos in 
      valid_pos

let test () : bool =
  (move_robot 10 "forward" 3) = 13
;; run_test "move_robot forward in bounds" test

let test () : bool =
  (move_robot 1 "backward" 4 ) = 0
;; run_test "move_robot backward out of bounds" test

let test () : bool =
  (move_robot 10 "backward" 3) = 7
;; run_test "move_robot backward in bounds" test

let test () : bool =
  (move_robot 83 "forward" 30) = 99
;; run_test "move_robot forward out of bounds" test

(*************************************************************************)
(* Problem 4 (Philadelphia geography) *)

(* Philadelphia has a fairly logical layout: the numbered streets
   are typically one-way, and their direction is determined by their
   number and where you are in the city.
  
   Even streets go one way and odd streets go another:
  
     East of Broad (< 14th): even go south, odd go north
     West of Broad (> 14th): even go north, odd go south
     West Philly  (>= 32nd): even go south, odd go north
     West Philly  (>= 46th): two-way
  
   There are, however, a few exceptions.
     - 1st and 14th do not actually exist as street names -- they're
       called Front and Broad. We'll ignore this and pretend they do.
     - Broad (14th), 25th, 38th, 41st, and 42nd are all two-way.
     - 24th and 59th go south.
     - 58th goes north.
  
   Write a program that returns one of four string values for each street
   number:
     - "N/A" when the street doesn't exist. We only consider 1st
       through 69th Streets.
     - "N" when the street goes north.
     - "S" when the street goes south.
     - "NS" when the street is two-way.
  
   Hints:
     - You may find the infix `mod` (modulo) function useful: for example,
       `x mod 2` evaluates to 0 if x is even and 1 otherwise.
     - Sometimes there's no simple-and-clever way of writing down a
       complex case analysis: you just have to write out all the cases.
  
   Welcome to Philadelphia! *)

let rec street_direction (st: int) : string =
  if st < 1 then "N/A"
  else if st = 14 || st = 25 then "NS"
  else if st = 38 || st = 41 then "NS"
  else if st = 42 then "NS"
  else if st = 24 || st = 59 then "S"
  else if st = 58 then "N"
  else if st > 69 then "N/A"
  else if st < 14 then (if st mod 2 = 1 then "N" else "S")
  else if st < 32 then (if st mod 2 = 1 then "S" else "N")
  else if st < 46 then (if st mod 2 = 1 then "N" else "S")
  else "NS"

let test () : bool =
  (street_direction 14) = "NS"
;; run_test "street_direction Broad is two-way" test

let test () : bool =
  (street_direction 9) = "N"
;; run_test "street_direction 9th goes north" test

let test () : bool =
  (street_direction 18) = "N"
;; run_test "street_direction 18th goes north" test

let test () : bool =
  (street_direction 44) = "S"
;; run_test "street_direction 44th goes south" test

let test () : bool =
  (street_direction 70) = "N/A"
;; run_test "street_direction 70th doesn't exist" test


(* The last part of this file is a print statement. When you see this
   line after running your code, you will know that all of the tests
   in this file have succeeded. *)
;; print_endline "intro.ml: ran to completion"
