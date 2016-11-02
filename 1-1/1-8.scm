(define (improve guess x)
  (/ (+
       (/ x (square guess)) 
       (* 2 guess))
     3))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (/ (- (improve guess x) guess) 
             guess)) 
     0.000001))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x) x)))

(define (cbrt x)
  (cbrt-iter 1.0 x))

; yields 5.000000000287929
(cbrt 343)
