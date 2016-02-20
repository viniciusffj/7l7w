;; (def accss (ref [1500 2000 10000)

;; Usage (ballance accs 2)
(defn ballance [accounts accountId] (@accounts accountId))

;; Usage (debit accs 1 100)
(defn debit [accounts accountId value] 
  (dosync 
    (alter accounts assoc accountId 
           (- (@accounts accountId) value)
           )))

;; Usage (credit accs 0 1000)
(defn credit [accounts accountId value] 
  (dosync 
    (alter accounts assoc accountId 
           (+ (@accounts accountId) value)
           )))
