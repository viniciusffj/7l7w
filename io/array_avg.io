List myAvg := method(
    sum := 0
    size := self size
    if (size == 0, return 0)

    self foreach(value, 
        if(value type != Number type, Exception raise("Value is not a number"))
        sum = sum + value
    )
    sum/size
)

writeln("Avg(1 2 3) = ", list(1, 2, 3) myAvg)
writeln("Avg(5 10 15) = ", list(5, 10, 15) myAvg)
writeln("Avg() = ", list() myAvg)
writeln("Avg(1, \"a\", 2) = ", list(1, "a", 2)  myAvg)
