;; open Assert
;; open Cipher
(* Test out our functions *)
let () = print_endline (
  let msg :string = "This is an amazing secret message!" in
  let pad :string = "AKJHLGJKSHAJKALKSHGJLKSAHLKGJSHKJAHLKJHS" in
      (encipher msg pad)
)
let () = print_endline (
    let msg :string = "This is an amazing secret message!" in
    let pad :string = "AKJHLGJKSHAJKALKSHGJLKSAHLKGJSHKJAHLKJHS" in
        (decipher (encipher msg pad) pad)
)
let () = print_endline (
    let msg :string = "Test" in 
    let pad :string = "AAAA" in
        (encipher msg pad))
let () = print_endline (
    let msg :string = "Test" in 
    let pad :string = "AAAA" in
        (decipher(encipher msg pad) pad))
let () = print_endline (
    let msg :string = "Test" in 
    let pad :string = "ABCD" in
        (encipher msg pad))
let () = print_endline (
    let msg :string = "Test" in 
    let pad :string = "ABCD" in
        (decipher(encipher msg pad) pad))