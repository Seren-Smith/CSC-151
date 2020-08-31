# Practice with tuples.

tup = (1, 3.0, "five", 7, '9')
println(tup[3])
println(tup[3:5])

for i in tup
  println(i)
end

println(3 in tup)
println(4 in tup)

dimtup = ((1, 2), (3, 4), (5, 6))
println(dimtup)

namedtup = (a=1, b="two", c='3')
println(namedtup)
