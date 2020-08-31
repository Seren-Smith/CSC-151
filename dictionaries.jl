# Practice with dictionaries.

d1 = Dict("a" => 1, "b" => 2, "c" => 3)
println(d1)

d2 = Dict{String, String}()
d2["key1"] = "val1"
println(d2)

println(d1["b"])

d1["d"] = 4
println(d1)

println(haskey(d1, "e"))

delete!(d1, "c")
println(d1)

println(keys(d1))
println(values(d1))

for (key, value) in d1
  println(key, ", ", value)
end

