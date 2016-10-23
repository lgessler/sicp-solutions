; from before
(define (square x) (* x x))
(define (sum-of-squares x y)
(+ (square x) (square y)))

; begin program
(define (larger x y)
  (if (> x y) x y))
(define (smaller x y)
  (if (< x y) x y))

(define (sum-of-squares-for-two-greatest-of-three x y z)
  (sum-of-squares
    (larger x y)
    (larger (smaller x y) z)))
  
(sum-of-squares-for-two-greatest-of-three 3 4 5)
