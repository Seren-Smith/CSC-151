# Practicing with exceptions.

arg = -9

try
  x = sqrt(arg)
  println(x)
catch ex
  println(ex)
finally
  println("This section of code will always run.")
end