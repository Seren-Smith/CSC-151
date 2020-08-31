function helloworld()
  println("Hello world!")
end 

function helloworld(count::Int)
  for i in 1:count
    println("Hello world! ", i)
  end 
end

helloworld()

helloworld(3)