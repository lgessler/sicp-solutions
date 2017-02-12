(define (g) (display "hi!"))
(define (f g) (g))

;; Our function `g` wants to greet us, but unfortunately, if the thunk were not
;; evaluated before the evaluation of f's body, we will not be able to apply g.
