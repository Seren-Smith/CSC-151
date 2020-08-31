struct MyType
  field1::Int
  field2::String
end

x = MyType(10, "ABC")
println(x)

println(x.field1)
println(x.field2)

mutable struct MyMutableType
  field1::Int
  field2::String
end

x = MyMutableType(10, "ABC")
println(x.field1)
println(x.field2)

x.field2 = "DEF"
println(x)

println(isa(x, MyMutableType))
