# Practice writing functions.

function myfunc(a, b)
  println("This is a function.")
  a + b
end 

result = myfunc(10, 15)
println(result)

function foo(a, b, z = 10)
  return (a + b) * z
end

println(foo(2, 3))
println(foo(2, 3, 5))

function bar(a, b ; multiplier = 10)
  return (a + b) * multiplier
end 

println(bar(4, 5))
println(bar(multiplier = 5, 4, 5))

myfunc(x, y) = (a = x - 1; 2a + y)
println(myfunc(3, 4))

function summit(args...)
  sum = 0
  for a in args
    sum += 1
  end

  return sum
end 

println(summit(1, 5, 10))
println(summit(2, 4, 6, 8))
