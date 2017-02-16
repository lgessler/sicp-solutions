;; I think this should run faster. `distinct?` seems expensive to run whereas
;; the other requirements are cheaper. If we put the cheap requirements first
;; then we can rest assured that the really expensive requirement will only be
;; run if everything else is in place.
(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5))
        (cooper (amb 1 2 3 4 5))
        (fletcher (amb 1 2 3 4 5))
        (miller (amb 1 2 3 4 5))
        (smith (amb 1 2 3 4 5)))
    (require (not (= baker 5)))
    (require (not (= cooper 1)))
    (require (not (= fletcher 5)))
    (require (not (= fletcher 1)))
    (require (> miller cooper))
    (require
      (not (= (abs (- smith fletcher)) 1)))
    (require 
      (not (= (abs (- fletcher cooper)) 1)))
    (require
      (distinct? (list baker cooper fletcher 
                       miller smith)))
    (list (list 'baker baker)
          (list 'cooper cooper)
          (list 'fletcher fletcher)
          (list 'miller miller)
          (list 'smith smith))))   

