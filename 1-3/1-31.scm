(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))

(define (fact n)
  (product (lambda (i) i)
           1
           (lambda (n) (+ n 1))
           n))

; treat every term as 
(define (pi-approx n)
  (define (pi-term n)
    (/ (square (+ 2 (* 2 n)))
       (square (+ 1 (* 2 n)))))
  (define (adjust-result res)
    (* 4 (/ (* 2 res) (+ 3 (* 2 n)))))
  (adjust-result (product pi-term 1 (lambda (n) (+ n 1)) n)))

(exact->inexact (pi-approx 15500))
