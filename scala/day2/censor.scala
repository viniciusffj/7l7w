import scala.io.Source

trait Censor {
    def cleanWord(cursed : String) : String
    def replace(sentence : String) : String = {
        sentence.split(" ").map(w => cleanWord(w)).mkString(" ")
    }
}

class SimpleCensor(file:String) extends Censor {
    var cursedWords = scala.collection.mutable.Map[String, String]()

    Source.fromFile(file).getLines().foreach { s =>
        val keyValue = s.split(":") 
        cursedWords += keyValue(0) -> keyValue(1)
    }

    def cleanWord(word : String) : String = {
        if (cursedWords.contains(word)) cursedWords(word) else word
    }
}

println(new SimpleCensor("words").replace("Hey Darn there's a Shoot"))

