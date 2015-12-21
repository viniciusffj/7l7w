TwoDimList := List clone

TwoDimList dim := method(x, y, 
    for(i, 1, x, 
        newList := list()
        for(j, 1, y, newList append(0))
        self append(newList)
    )
    self
)

TwoDimList get := method(x, y, 
    self at(x) at(y)
)

TwoDimList set := method(x, y, value,
    self at(x) atPut(y, value)
)

TwoDimList transpose := method(
    x := self size
    y := self at(0) size
    transposed := TwoDimList clone
    transposed dim(y, x)

    for(i, 0, x - 1, 
        for(j, 0, y - 1, 
            value := self get(i, j)
            transposed set(j, i, value)
        )
    )

    transposed
)

TwoDimList toString := method(
    output := ""
    self foreach(list, 
        list foreach(v, 
            output := "#{output}#{v} " interpolate
        )
        output := "#{output}\n" interpolate
    )
    output
)

TwoDimList writeToFile := method(fileName, 
    file := File with(fileName)
    file remove
    file openForUpdating
    file write(self toString)
    file close
)

TwoDimList readFromFile := method(fileName, 
    file := File with(fileName)
    self := List clone

    file openForReading

    line := file readLine
    while(line != nil, 
        arr := line split(" ")
        self append(arr)
        line := file readLine
    )

    file close
    self
)

myArr := TwoDimList clone

writeln("*** Operations ***")

writeln(myArr dim(2, 3))

myArr set(0, 0, 10)
myArr set(0, 1, 5)
myArr set(1, 2, 200)

writeln("After set: ", myArr)

writeln("0, 0 => ", myArr get(0, 0))
writeln("0, 1 => ", myArr get(0, 1))
writeln("1, 2 => ", myArr get(1, 2))

writeln("*** Transpose ***")

oldArr := TwoDimList clone
oldArr dim(2, 2)

oldArr set(0, 0, 1)
oldArr set(0, 1, 2)
oldArr set(1, 0, 3)
oldArr set(1, 1, 4)

writeln("old array: ", oldArr)
writeln("new array: ", oldArr transpose)

writeln("*** File ***")

fileName := "myArr.txt"
myArr writeToFile(fileName)
writeln("We wrote ", myArr, " to file ", fileName)

fromFileArr := TwoDimList readFromFile(fileName)
writeln("We read ", fromFileArr)
