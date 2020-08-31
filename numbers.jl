a = Int16(1)
println(typeof(a))

b = Int(2000)
println(typeof(b))

c = UInt16(1)
println(typeof(c))

println(typemax(Int8))
println(typemax(Int16))
println(typemax(Int32))
println(typemax(Int64))
println(typemin(Int8))
println(typemin(Int16))
println(typemin(Int32))
println(typemin(Int64))
println(Sys.WORD_SIZE)

println(1.0 / 0.0)
println(1.0 / Inf)
println(0.0 / 0.0)