arr1 = [2, 8, -3, -15, 5, -7, 9, 0, 11]

result = sort(arr1, by = abs)
println(result)

arrtup = [(1, 2), (2, 1), (3, 5), (4, 0)]
println(issorted(arrtup, by = x -> x[1]))

struct MyRect
  length::Int
  width::Int
end

arr2 = [MyRect(12, 22), MyRect(10, 18), MyRect(7, 12), MyRect(9, 30)]

function comparearea(rect1::MyRect, rect2::MyRect)
  area1 = rect1.length * rect1.width
  area2 = rect2.length * rect2.width
  return area1 < area2
end 

sort!(arr2, lt = comparearea)
println(arr2)
