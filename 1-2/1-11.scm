; recursive solution
(define (three-func-rec n)
  (define (tf n)
    (cond ((< n 3) n)
          (else (+
                  (tf (- n 1))
                  (* 2 (tf (- n 2)))
                  (* 3 (tf (- n 3)))))))
  (tf n))

(define (three-func-iter n)
  (define (tf x y z count)
    (cond ((< x 3) x)
          ((= count 0) x)
          (else (tf (+ x (* 2 y) (* 3 z)) x y (- count 1)))))

  (if (< n 3)
    n
    (tf 4 2 1 (- n 3))))

(and 
  (= (three-func-rec 2) (three-func-iter 2))
  (= (three-func-rec 3) (three-func-iter 3))
  (= (three-func-rec 4) (three-func-iter 4))
  (= (three-func-rec 5) (three-func-iter 5))
  (= (three-func-rec 6) (three-func-iter 6))
  (= (three-func-rec 7) (three-func-iter 7))
  (= (three-func-rec 8) (three-func-iter 8))
  (= (three-func-rec 9) (three-func-iter 9))
  (= (three-func-rec 10) (three-func-iter 10))
  (= (three-func-rec 11) (three-func-iter 11)))
;
