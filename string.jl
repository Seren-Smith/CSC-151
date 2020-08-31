mychar = 'x'
println(Int(mychar))
println(Char(120))

mystr = "This is a simple string in Julia"
altstr = """
Hello There,
Here is another string
"""

println(length(mystr))
println(mystr[1])
println(mystr[end])
println(mystr[end - 3])

println(mystr[3:end - 1])

for c in mystr
  print(c)
end
println()

w1 = "Hello"
w2 = "World"
println(w1 * "? " * w2 * "?")

a = 5
b = 10
println("The result of $a + $b is $(a+ b).")