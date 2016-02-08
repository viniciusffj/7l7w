;; function to check if st is longer than n characters
(defn big [st n] (< n (count st)))


;; function to return the type of the sequence
(defn collection-type [col] (cond 
                              (vector? col) :vector 
                              (map? col) :map 
                              (list? col) :list 
                              :else :other))
