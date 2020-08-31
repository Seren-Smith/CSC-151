# Practice with arrays.

arr = [1, 2, 3, 4, 5]
println(arr)
println(typeof(arr))
println(length(arr))

println("Element at position 2 is ", arr[2], ".")

arr2 = ["one", 2, 3.0, -4]
println(arr2)
println(typeof(arr2))

arr3 = Float64[]
push!(arr3, 1.0, 2.0, 3.0)
println(arr3)

arr4 = zeros(4)
println(arr4)
arr4 = ones(4)
println(arr4)
arr5 = fill(5, 7)
println(arr5)

newarr = sort(arr, rev = true)
println(arr)

sort!(newarr)
println(newarr)

strval = join(arr, "-")
println(strval)