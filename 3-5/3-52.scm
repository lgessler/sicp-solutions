(define (stream-car stream) 
  (car stream))

(define (stream-cdr stream) 
  (force (cdr stream)))

(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low
      (stream-enumerate-interval (+ low 1)
                                 high))))

(define (stream-ref s n)
  (if (= n 0)
    (stream-car s)
    (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
    the-empty-stream
    (cons-stream 
      (proc (stream-car s))
      (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc s)
  (if (stream-null? s)
    'done
    (begin 
      (proc (stream-car s))
      (stream-for-each proc 
                       (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (show x)
  (display-line x)
  x)

(define (display-line x)
  (newline)
  (display x))

;;----------

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq 
  (stream-map 
    accum 
    (stream-enumerate-interval 1 20)))

;; sum is 1 since stream-map applies the pred once to the first in the stream

(define y (stream-filter even? seq))

;; sum is now 6 because the first item in this seq is 3, which is not even

(define z 
  (stream-filter 
    (lambda (x) 
      (= (remainder x 5) 0)) seq))

;; sum is now 10

(stream-ref y 7)

;; sum is now 136

(display-stream z)

;; 210

;; With no memoization, we would have had to recalculate the common elements of
;; the stream operations, and since stream accesses are side-effecting
;; operations here, sum would have been affected, changing our answer.
