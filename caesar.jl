function rot(ch::Char, key::Integer)
    if key < 1 || key > 25 end
    if isalpha(ch)
        shft = ifelse(islower(ch), 'a', 'A')
        ch = (ch - shft + key) % 26 + shft
    end
    return ch
end

rot(str::AbstractString, key::Integer) = map(x -> rot(x, key), str)
 
msg = "This is a message to be enciphered with the Caesar Cipher."
key = 3
invkey = 26 - 3
 
println("# The original message: $msg\n  Encrypted message: $(rot(msg, key))\n  Decrypted message: $(rot(rot(msg, key), invkey))")