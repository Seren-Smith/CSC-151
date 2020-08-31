# Practice with loops.

for i in 1:10
  println("i: ", i)
end 

for i in ["Bingo", "Bongo", "Bango"]
  println(i)
end

# Nested for loop.
for i in 1:3, j in 2:4
  println("[i: ", i, "] [j: ", j, "]")
end

# Testing a while loop.
i = 1
while i <= 5
  println(i)
  global i += 1
end

animal = ("Lions", "Penguins", "Bears", "Tigers")
for (idx, val) in enumerate(animal)
  println(idx, ", ", val)
end 
