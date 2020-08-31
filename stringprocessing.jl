mystr = "Angstrom"
teststr = "julia"

println("String length: ", length(teststr))
println("Size of string: ", sizeof(teststr))
println("String length: ", length(mystr))
println("Size of string: ", sizeof(mystr))

teststr = "Hello" * "World"
println(teststr)

teststr = "ABCD" ^ 3
println(teststr)

teststr = "Julia programming rocks."
println(findnext("Julia", teststr, 0))
println(occursin("rock", teststr))

teststr = lpad("Test String", 20)
println(teststr)
teststr = rpad("Test String", 20, '*')
println(teststr)

arr = ["Lions", "Tigers", "Bears"]
teststr = join(arr, ", ", " and ")
println(teststr)