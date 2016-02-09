; unless macro with else option
(defmacro unless
  [test bodyF bodyT]
  (list 'if (list 'not test) bodyF bodyT)
        )
(unless false (println "true")  (println "false"))
(unless true (println "true")  (println "false"))

; example of a defrecord that implements a protocol
(defprotocol Person
  (say_hi [this]))

(defrecord BrazilianPerson []
  Person
  (say_hi [this] (println "Oi")))

(defrecord EnglishPerson []
  Person
  (say_hi [this] (println "Hi")))

(def brazilian (BrazilianPerson. ))
(def english (EnglishPerson. ))
(say_hi brazilian)
(say_hi english)
