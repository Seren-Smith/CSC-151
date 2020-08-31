# Practice with conditionals.

x = 15
if x < 10
  println("x is small")
elseif x >= 10 && x < 25
  println("x is medium")
else
  println("x is big")
end

println(x < 10 ? "x is less than 10" : "x is 10 or greater")