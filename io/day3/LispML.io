OperatorTable addAssignOperator(":", "atPutNumber") 

curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

Map atPutNumber := method(
    key := call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\"")
    value := call evalArgAt(1)
    self atPut(key, value)
)


Builder := Object clone

Builder prettyPrint := method(text, 
    str := ""
    self level repeat(str := str .. "\t");
    writeln(str, text);
)
Builder getProperties := method(arg,
    properties := ""
    if(arg name != "curlyBrackets", return properties)

    map := doMessage(arg)
    map foreach(k, v, 
        properties := properties .. " \"" .. k .. "\"=\"" .. v .. "\""
    )
    properties
)

Builder forward := method(
    firstArg := call message arguments first

    properties := getProperties(firstArg)

    prettyPrint("<" .. call message name .. properties .. ">")
    self level := self level + 1

    call message arguments foreach(tag, 
        content := self doMessage(tag)
        if(content type == "Sequence", prettyPrint(tag))
    )

    self level := self level - 1
    prettyPrint("</" .. call message name .. ">")
)

Builder level := 0


doFile("html_def.io")
