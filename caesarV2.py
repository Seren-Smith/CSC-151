# Shift a letter by the designated amount, regardless of case
def shiftLetter(c,shift):
    code = ord(c)
    if (code>=65) and (code<=90):
        code = (code+shift-39)%26+65
    elif (code>=97) and (code<=122):
        code = (code+shift-71)%26+97
    return chr(code)

# Shift all characters in a message by the designated amount, regardless of case
def shiftMessage(message,shift):
    return "".join([shiftLetter(c,shift) for c in message]);

# Shift all characters by 3 places right
def encipher(message):
    return shiftMessage(message,3)


# Shift all characters by 3 places left
def decipher(message):
    return shiftMessage(message,-3)

msg = "This is an amazing secret message!"
decipher(encipher(msg))