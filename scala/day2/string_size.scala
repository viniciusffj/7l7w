def totalSize(list: List[String]) : Int = {
    list.foldLeft(0)((sum, s) => sum + s.size)
}

val completedLanguages = List("Ruby", "Io", "Prolog", "Scala")
println("List is " + completedLanguages)
println("Total size is " + totalSize(completedLanguages))
