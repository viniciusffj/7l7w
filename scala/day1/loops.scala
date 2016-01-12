def whileLoop {
    var i = 1
    println("--- While loop ---")
    while(i <= 3) {
        println(i)
        i += 1
    }
}

whileLoop

def forLoop {
    println("--- for loop ---")
    for (i <- 0 until args.length) {
        println(args(i))
    }
}

forLoop

def rubyStyleForLoop {
    println("--- ruby style for loop ---")
    args.foreach { arg =>
        println(arg)
    }
}

rubyStyleForLoop
