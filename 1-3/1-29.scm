(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (yk k) (f (+ a (* k h))))

  ; tail-recursive ("iterative") implementation of the summation
  (define (s total count)
    ; in first branch, correct for adding 2*y_0 and 2*y_n during loop
    (cond ((> count n) (- total (yk 0) (yk n)))
          ((even? count) (s (+ total (* 2 (yk count))) 
                            (+ count 1)))
          (else (s (+ total (* 4 (yk count))) 
                   (+ count 1)))))
  (* (/ h 3) (s 0 0)))

(define (cube x) (* x x x))

(simpson cube 0 1 100)
