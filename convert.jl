x = 10
y = 20.0
z = "40"
f = "30.00"

c = Char(74)
println(c)

i = Int('J')
println(i)

# Practice converting between types.
flt1 = Float32(x)
int1 = Int16(y)
println(flt1)
println(int1)

# Parse values from strings.
a = parse(Int, z)
b = parse(Float64, f)
println(a)
println(b)

# Convert to string.
c = string(y)
println(c)
