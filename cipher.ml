;; open Assert

(* ~~~~~~~~~~~~~~~~~~~~~~ *)
(* Some utility functions *)
(* Converts a string to a char list *)

let char_list_of_string (s :string) :char list = 
  List.init (String.length s) (String.get s)

  (* Converts a char to a string *)

  let string_of_char (c :char) :string =
  String.make 1 c

  (* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(* Define additional helper functions here as needed *)
(* Shift a letter by the designated amount, regardless of case *)

let shiftLetter (c:char) (shift:int) :char =
    let code:int = (int_of_char c) in
    if ((code >= 65) && (code <= 90)) then
        char_of_int (((code + shift - 39) mod 26) + 65)
    else if ((code >= 97) && (code <= 122)) then
        char_of_int (((code + shift - 71) mod 26) + 97)
    else
        c

(* Converts a string to a char list *)
let char_list_of_string (s :string) :char list = 
  List.init (String.length s) (String.get s)

(* Converts a char to a string *)
let string_of_char (c :char) :string =
  String.make 1 c

(* Takes a message and a pad to produce an enciphered message *)
let shift (message:string) (shift:int) :string =
    let doShift (c:char) :char = (shiftLetter c shift) in
    (String.map doShift message)

(* Returns true if the character is an upper or lower case letter *)
let isLetter (c: char) :bool =
  let code:int = (int_of_char c) in
  if ((code >= 65) && (code <= 90)) then
      true
  else if ((code >= 97) && (code <= 122)) then
      true
  else
      false
 
let rec shiftMessage (lmessage: char list) (lpad: char list) (padUsed: int) (dir: int) :string =
  begin match lmessage with 
  | [] -> ""
  | hd :: tl ->
  if isLetter hd = true then (shift(string_of_char hd) (dir * (int_of_char (List.nth lpad padUsed) - 65))) ^ shiftMessage tl lpad (padUsed + 1) dir
    else (shift(string_of_char hd) (dir * (int_of_char (List.nth lpad padUsed) - 65))) ^ shiftMessage tl lpad padUsed dir
 end 

let encipher (message: string) (pad: string) :string = 
  (* This should convert the message and the pad to char list and then call shiftMessage with padUsed as 0 and dir as 1 *)
  let lmessage = char_list_of_string message in
  let lpad = char_list_of_string pad in 
  let padUsed = 0 in 
  let dir = 1 in
  shiftMessage lmessage lpad padUsed dir
  
let decipher (message:string) (pad: string) :string = 
  (* This should convert the message and the pad to char list and then call shiftMessage with padUsed as 0 and dir as -1 *)
  let lmessage = char_list_of_string message in
  let lpad = char_list_of_string pad in 
  let padUsed = 0 in 
  let dir = -1 in
  shiftMessage lmessage lpad padUsed dir
