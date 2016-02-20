(def total_chairs 20)
(def haircut_duration 20)
(def time_opened 10000)
(def is_open? (agent true))
(def haircuts (agent 0))
(def chairs (agent 0))

(defn new_customer [chairs is_open?]
  (future 
    (while @is_open?
      (do 
        (Thread/sleep (+ 10 (rand-int 21)))
        (if (< @chairs total_chairs)
          (do
            (send chairs inc)
            (println "new customer")))))))

(defn haircut [chairs haircuts is_open?]
  (future 
    (while @is_open?
      (do 
        (if (> @chairs 0)
          (do
            (Thread/sleep haircut_duration)
            (send chairs dec)
            (send haircuts inc)
            (println "new haircut")))))))

(println "Barber shop is open!")
(new_customer chairs is_open?)
(haircut chairs haircuts is_open?)

(Thread/sleep time_opened)
(send is_open? not)

(Thread/sleep 30)
(println "We are closed! Total haircuts was" @haircuts)
