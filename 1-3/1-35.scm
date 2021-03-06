;Here I only give an implementation of a \phi approximator
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

;print as decimal in REPL
(exact->inexact 
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))
