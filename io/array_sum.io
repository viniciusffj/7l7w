array_sum := method(arr, 
    sum := 0

    arr foreach(sec_arr, 
        sec_arr foreach(num, 
            sum := sum + num
        )
    )

    sum
)

myArray := list(list(1, 2, 3), list(1, 2, 3))

writeln("Sum is ", array_sum(myArray) )
