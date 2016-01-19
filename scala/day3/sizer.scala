import scala.io._
import scala.actors._
import Actor._

object PageLoader {
    val encoding = "ISO-8859-15"
    val pattern = """(<a)""".r

    def getPageContent(url: String) = Source.fromURL(url, encoding).mkString
    def getSizeAndLinks(url: String) = {
        val content = getPageContent(url)
        val size = content.length
        val links = (pattern findAllIn content).length
        (size, links)
    }
}

val urls = List("http://www.verdao.net/", 
                "http://www.verdazzo.com.br/", 
                "http://www.cnn.com/")

def timeMethod(method: () => Unit) = {
    val start = System.nanoTime
    method()
    val end = System.nanoTime
    println("Method took " + (end - start)/ 1000000000 + " seconds.")
}

def getPageSizeSequentially() = {
    for(url <- urls) {
        val (size, links) = PageLoader.getSizeAndLinks(url)
        println("Size for "  + url + ": " + size)
        println("Links for " + url + ": " + links)
    }
}

def getPageSizeConcurrently() = {
    val caller = self
    for(url <- urls) {
        actor {
            val (size, links) = PageLoader.getSizeAndLinks(url)
            caller ! (url, size, links) 
        }
    }

    for (i <- 1 to urls.size) {
        receive {
            case (url, size, links)  => {
                println("Size for " + url + ": " + size)
                println("Links for " + url + ": " + links)
            }
        }
    }
}

println("Sequential run:")
timeMethod { getPageSizeSequentially }
println("Concurrent run:")
timeMethod { getPageSizeConcurrently }
