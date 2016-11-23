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

; above from 2-2.scm

; helper: magnitude of seg
(define (len seg) 
  (let ((p1 (start-seg seg))
        (p2 (end-seg seg)))
    (let ((x1 (x-pt p1))
          (y1 (y-pt p1))
          (x2 (x-pt p2))
          (y2 (y-pt p2)))
      (expt (+ (expt (- y2 y1) 2)
               (expt (- x2 x1) 2))
            0.5))))

(define (perimeter rect) 
  (+ (* 2 (width rect))
     (* 2 (height rect))))

(define (area rect)
  (* (width rect) (height rect)))

; representation one: side and perp side
(define (make-rect side perp-side) (cons side perp-side))
(define (width rect) (len (car rect)))
(define (height rect) (len (cdr rect)))


(define r1 (make-rect (make-seg (make-pt 0 0) (make-pt 0 4))
                      (make-seg (make-pt 0 0) (make-pt 8 0))))

(area r1)
(perimeter r1)


; representation two: side and parallel side
(define (make-rect side parallel-side) (cons side parallel-side))
(define (width rect) (len (car rect)))
(define (height rect) 
  (len (make-seg (end-seg (car rect)) 
                 (end-seg (cdr rect)))))


(define r2 (make-rect (make-seg (make-pt 0 0) (make-pt 4 0))
                      (make-seg (make-pt 0 8) (make-pt 4 8))))

(area r2)
(perimeter r2)

