; from before
(define (square x) (* x x))
(define (sum-of-squares x y)
(+ (square x) (square y)))

; begin program
(define (two-greatest-of-three x y z)
  (cond ((and (< x y) (< x z)) (list y z))
        ((and (< y x) (< y z)) (list x y))
        (else (list x z))))

(define (sum-of-squares-for-two-greatest-of-three x y z)
  (apply sum-of-squares (two-greatest-of-three x y z)))
  
(sum-of-squares-for-two-greatest-of-three 3 4 5)
