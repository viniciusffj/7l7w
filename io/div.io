oldDiv := Number getSlot("/")

Number / := method(n, if(n == 0, 0, self oldDiv(n) ) )

writeln("10/2 = ", 10/2)
writeln("10/5 = ", 10/5)
writeln("10/0 = ", 10/0)
