;; open Cipher

(* Reads a file and returns the contents as a string list *)
(* From https://stackoverflow.com/questions/5774934/how-do-i-read-in-lines-from-a-text-file-in-ocaml *)
let read_file (filename : string) : string list= 
  let ic = open_in filename in
  let try_read () =
    try Some (input_line ic) with End_of_file -> None in
  let rec loop acc = match try_read () with
    | Some s -> loop (s :: acc)
    | None -> close_in ic; List.rev acc in
  loop []

(* Prints a list of strings, one per line *)
let rec print_lines (lines : string list) : unit = 
  begin match lines with
  | [] -> ()
  | first::rest -> print_endline first ; print_lines rest
  end

(* Given the names of a message file and a pad file, reads them and then deciphers *)
let decipher_file (mfile :string) (pfile :string) :string =
  let message = String.concat "\n" (read_file mfile) in
  let pad = String.concat "" (read_file pfile) in
  decipher message pad

(* Sys.argv.(n) reads the n_th command line argument following the program name. 
 * So for example, if we enter the following at the command line
 *   ./cipher message.txt pad.txt
 * then Sys.argv.(1) will hold "message.txt" and Sys.argv.(2) will hold "pad.txt"
 *)
;; print_endline (decipher_file Sys.argv.(1) Sys.argv.(2))