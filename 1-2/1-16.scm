; Iterative fast-expt
(define (even? n)
  (= (remainder n 2) 0))

(define (square n) (* n n))

(define (** b n)
  (define (iter-fast-expt b n a)
    (cond ((= n 0) a)
          ((even? n) (iter-fast-expt b (/ n 2) (* (square b) a)))
          (else (iter-fast-expt b (- n 1) (* b a)))))
  (iter-fast-expt b n 1))
