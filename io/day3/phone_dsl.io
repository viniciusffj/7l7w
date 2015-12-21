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

s := "{\"a\": \"1\", \"b\": \"2\"}"

json := doString(s)
json keys println
json values println
