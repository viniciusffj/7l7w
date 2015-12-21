Builder := Object clone

Builder forward := method(
    writeln("<", call message name, ">")
    call message arguments foreach(tag, 
        content := self doMessage(tag)
        if(content type == "Sequence", writeln(tag))
    )
    writeln("</", call message name, ">")
)

Builder ul(
    li("Io"), 
    li("Lua"), 
    li("Javascript")
)
