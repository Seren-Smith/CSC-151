arr1 = [2, 4, 5, 8]
println(arr1)

result = arr1 .* 3
println(result)

result = sqrt.(arr1)
println(result)

f(x) = 3x
result = f.(arr1)
println(result)