;from waaay before
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

(define accumulate fold-right)

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(define (unique-pairs n)
  (flatmap
    (lambda (i) 
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))


; begin 2.41

; quick and dirty, this could obviously be optimized
(define (unique-triples n)
  (flatmap
    (lambda (i) 
      (flatmap (lambda (j) 
                 (map (lambda (k) 
                        (list i j k))
                      (enumerate-interval 1 n)))
               (enumerate-interval 1 n)))
    (enumerate-interval 1 n)))

(define (ordered-triples n s)
  (define (sums-to-s? trip)
    (= s (+ (car trip) (cadr trip) (caddr trip))))
  (filter sums-to-s? (unique-triples n)))

(ordered-triples 3 5)


