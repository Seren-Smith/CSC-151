# Importing a module.
using Random

println(rand())

for i in 1:3 
  println(rand([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
end

  arr = rand(UInt8, 5)
  println(arr)

  println(randstring("ABCD"))
  println(randstring('a':'z', 6))

  vowels = ["A", "E", "I", "O", "U"]
  Random.shuffle!(vowels)
  println(vowels)

  Random.seed!(1000)
  println(rand())
  println(rand())
  