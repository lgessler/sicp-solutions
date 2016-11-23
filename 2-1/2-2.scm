(define (make-pt x y) (cons x y))
(define (x-pt pt) (car pt))
(define (y-pt pt) (cdr pt))

(define (make-seg start end) (cons start end))
(define (start-seg seg) (car seg))
(define (end-seg seg) (cdr seg))

(define (print-pt p)
  (newline)
  (display "(")
  (display (x-pt p))
  (display ",")
  (display (y-pt p))
  (display ")"))

(define (midpoint seg)
  (let ((start (start-seg seg))
        (end (end-seg seg)))
    (let ((x1 (x-pt start))
          (y1 (y-pt start))
          (x2 (x-pt end))
          (y2 (y-pt end)))
      (make-pt (/ (+ x2 x1) 2)
               (/ (+ y2 y1) 2)))))

(define seg1 (make-seg
               (make-pt 1 1)
               (make-pt 3 3)))

(print-pt (midpoint seg1))
