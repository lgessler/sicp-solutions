(define count 0)
(define (id x) (set! count (+ count 1)) x)


(define w (id (id 10)))

count ;=> 0

w ;=> 10

count ;=> 2

