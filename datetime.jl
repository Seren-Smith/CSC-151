using Dates

d1 = Date(2018, 12, 22)
dt1 = DateTime(2019, 7, 28)
println("Date: ", d1)
println("Date and time: ", dt1)

df1 = DateFormat("y-m-d")
d2 = Date("2020-10-10", df1)
println("Date: ", d2)

d3 = Date(2019, 12, 22)
d4 = Date(2019, 7, 28)
dt3 = DateTime(2000, 01, 01)
dt4 = DateTime(2000, 12, 31)

println(d4 < d3)
println(d3 - d4)
println(dt3 - dt4)

println(Dates.year(d3))
println(Dates.week(d4))

println(Dates.dayofweek(d3))
println(Dates.dayname(d3))
println(Dates.isleapyear(d3))

println(Dates.firstdayofweek(d4))
println(Dates.lastdayofmonth(d4))

