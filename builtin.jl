# Some built-in math functions.
x = round(50.3)
println(x)

x = round(50.3, RoundUp)
println(x)

y = 29.95
println(floor(y))
println(ceil(y))

z = -15
println(abs(z))

# Some built-in text functions.
print("Hello ")
print("there ")
print("world!")
println()

thestr = "This is some text!"
printstyled(thestr)
println()
printstyled(thestr, bold = true)
println()
printstyled(thestr, bold = true, color=:blue)
println()

print("What is your name? ")
name = readline()
println()
print(name)
println() 

println(isascii("abc"))
println(isdigit('9'))
println(isdigit('i'))
println(isspace(' '))
