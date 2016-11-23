(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (add-1 zero))
;=>
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;=>
(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;=>
(lambda (f) (lambda (x) (f x)))

(define two (add-1 one))
;=>
(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
;=>
(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;=>
(lambda (f) (lambda (x) (f (f x))))

