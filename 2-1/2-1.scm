(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (numer rat) (car rat))
(define (denom rat) (cdr rat))

; exercise 2.1
(define (make-rat n d)
  (let ((g (abs (gcd n d))))
    (if (or (and (positive? n) (negative? d)) 
            (and (negative? n) (negative? d)))
      (cons (/ (* -1 n) g) (/ (* -1 d) g))
      (cons (/ n g) (/ d g)))))

(define one-third (make-rat 1 3))
(define negative-one-third (make-rat -1 3))

(print-rat (add-rat one-third negative-one-third))
(print-rat (make-rat 1 3))
(print-rat (make-rat 1 -3))
(print-rat (make-rat -1 3))
(print-rat (make-rat -1 -3))

