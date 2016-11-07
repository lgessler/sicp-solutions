(define (filtered-accumulate pred combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) 
            (combiner 
              (if (pred (term a)) 
                (term a)
                null-value)
              result))))
  (iter a null-value))


; odd instead because I don't want to bring in that pred
(define (sos-prime n)
  (filtered-accumulate 
    odd? 
    + 
    0
    (lambda (x) (* x x))
    1
    (lambda (i) (+ 1 i))
    n))

; didn't do b
