fib := method(n, 
    if(n < 3, 1, fib(n - 1) + fib(n - 2))
)

writeln("Recursion Fibonnaci of 1: ", fib(1))
writeln("Recursion Fibonnaci of 4: ", fib(4))

fib_loop := method(n,  
    last := 1
    current := 1

    for(i, 3, n, 1, 
        tmp := current
        current := current + last
        last := tmp
    )

    current
)

writeln("Loop Fibonnaci of 1: ", fib_loop(1))
writeln("Loop Fibonnaci of 2: ", fib_loop(2))
writeln("Loop Fibonnaci of 3: ", fib_loop(3))
writeln("Loop Fibonnaci of 4: ", fib_loop(4))
writeln("Loop Fibonnaci of 5: ", fib_loop(5))
writeln("Loop Fibonnaci of 6: ", fib_loop(6))
writeln("Loop Fibonnaci of 7: ", fib_loop(7))
writeln("Loop Fibonnaci of 8: ", fib_loop(8))
