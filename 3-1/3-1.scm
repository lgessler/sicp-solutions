(define (make-accumulator sum)
  (lambda (amount)
    (begin (set! sum (+ sum amount))
           sum)))


; the memory location that the parameter to the `make-accumulator` function
; persists?! we modify it with `set!` so it lives on the heap?
(define A (make-accumulator 1))
(A 2)
(A 3)

