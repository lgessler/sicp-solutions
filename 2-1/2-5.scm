(define (cons a b) 
  (define (expt b e)
    (if (= e 0)
      1
      (* b (expt b (- e 1)))))
  (* (expt 2 a) (expt 3 b)))

(define (count-0-remainder-divisions z divisor)
  (let ((res (/ z divisor)))
    (if (= 0 (remainder res divisor))
      (+ 1 (count-0-remainder-divisions res divisor))
      1)))
      
(define (car z) (count-0-remainder-divisions z 2))
(define (cdr z) (count-0-remainder-divisions z 3))


(car (cons 234 25))
(cdr (cons 54 925))
