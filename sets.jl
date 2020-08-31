# Practice with sets.

set1 = Set()
push!(set1, 3, "a", 3.1)
println(set1)

set2 = Set([1, 2, 3, 4, 2, 7, 1])
println(set2)

rainbow = Set{String}()
push!(rainbow, "red", "orange", "yellow", "green", "blue", "indigo", "violet")
println(rainbow)

println("red" in rainbow)

primarycolors = Set(["red", "yellow", "green", "blue"])
pastels = Set(["teal", "pink", "lavender", "coral"])

commoncolors = intersect(rainbow, primarycolors)
println(commoncolors)

allcolors = union(pastels)
println(allcolors)

diffcolors = setdiff(rainbow, primarycolors)
println(diffcolors)