print("Current working directory: ")
println(pwd())
println(readdir())

print("Current directory contents: ")

function createafile(filename::String, text::String = "This is some sample text.")
  io = open(filename, "w")
  write(io, text)
  close(io)
end

createafile("mytestfile.txt", "Hello, world!")

function readafile(filename::String)
  io = open(filename, "r")
  content = read(io, String)
  println(content)
end

readafile("mytestfile.txt")

function appendtoafile(filename::String, text::String)
  io = open(filename, "a")
  write(io, text)
  close(io)
end

appendtoafile("mytestfile.txt", " This text was added!")

readafile("mytestfile.txt")

rm("mytestfile.txt")