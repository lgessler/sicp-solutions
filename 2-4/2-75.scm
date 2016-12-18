; from before
(define (make-from-real-imag x y)
  (define (dispatch op)
    (cond ((eq? op 'real-part) x)
          ((eq? op 'imag-part) y)
          ((eq? op 'magnitude)
           (sqrt (+ (square x) (square y))))
          ((eq? op 'angle) (atan y x))
          (else (error "Unknown op:
                       MAKE-FROM-REAL-IMAG" op))))
  dispatch)

(define (make-from-mag-ang mag ang)
  (define (dispatch op)
    (cond ((eq? op 'real-part) (* (cos ang) mag))
          ((eq? op 'imag-part) (* (sin ang) mag))
          ((eq? op 'magnitude) mag)
          ((eq? op 'angle) ang)
          (else (error "Unknown op:
                       MAKE-FROM-MAG-ANG" op))))
  dispatch)
