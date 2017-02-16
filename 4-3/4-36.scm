;; This is the naïve approach described:
(define (a-pythagorean-triple)
  (let ((i (an-integer-starting-from 1)))
    (let ((j (an-integer-starting-from 1)))
      (let ((k (an-integer-starting-from 1)))
        (require (= (+ (* i i) (* j j))
                    (* k k)))
        (list i j k)))))

;; This won't do because only `k` will be incremented. We would generate no
;; triples. This should be adequate:

(define (a-pythagorean-triple)
  (let ((k (an-integer-starting-from 1)))
    (let ((j (an-integer-between 1 k)))
      (let ((i (an-integer-between 1 j)))
        (require (= (+ (* i i)
                       (* j j))
                    (* k k)))
        (list i j k)))))

;; This does not face the same looping problem because the two inner "loops" are
;; finitely bounded.
