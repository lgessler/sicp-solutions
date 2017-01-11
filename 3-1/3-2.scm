(define (make-accumulator sum)
  (lambda (amount)
    (begin (set! sum (+ sum amount))
           sum)))

(define (make-monitored f) 
  (define sum 0)
  (lambda (arg) 
    (cond ((eq? arg 'how-many-calls?) sum)
          ((eq? arg 'reset-count) (set! sum 0) 'ok)
          (else (begin
                  (set! sum (+ sum 1))
                  (f arg))))))

(define s (make-monitored sqrt))

(s 'how-many-calls?)
(s 100)
(s 'how-many-calls?)
(s 100)
(s 100)
(s 100)
(s 'how-many-calls?)
(s 'reset-count)
(s 'how-many-calls?)
(s 100)
(s 100)
(s 'how-many-calls?)

