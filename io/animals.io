Object ancestors := method(
    prototype := self proto

    if(prototype != Object, 
        writeln("Slots of ", prototype type, "\n----")

        prototype slotNames foreach(slot, writeln(slot))
        writeln()
        prototype ancestors
    )
)

Animal := Object clone
Animal speak := method("Animal speaking" println)

Duck := Animal clone
Duck speak := method("quack" println)
Duck walk := method("waddle" println)

disco := Duck clone
disco ancestors
