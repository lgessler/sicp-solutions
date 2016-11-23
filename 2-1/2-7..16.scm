(define (make-interval a b) (cons a b))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
    x
    ; 2.10
    (if (negative? (* (upper-bound y) (lower-bound y)))
      (error "Dividing by zero-spanning interval")
      (make-interval (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound y))))))

; 2.7
(define (lower-bound z) (car z))
(define (upper-bound z) (cdr z))

; 2.8
(define (subtract-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

; skip 2.9, 2.11

; 2.12
(define (make-center-percent center percent)
  (let ((delta (* (* percent 0.01) center)))
    (let ((lower-bound (- center delta))
          (upper-bound (+ center delta)))
      (cons lower-bound upper-bound))))

(define (percent z)
  (let ((center (/ (+ (lower-bound z) (upper-bound z)) 2)))
    (let ((delta (/ (- (upper-bound z) center) center)))
      (* 100 delta))))

(define (center z)
  (/ (+ (lower-bound z) (upper-bound z)) 2))

(define zz (make-center-percent 50 5))
(define zp (make-interval 47.5 52.5))
(percent zz)
(percent zp)

; skip 2.13

; 2.14 

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one (add-interval (div-interval one r1)
                        (div-interval one r2)))))

(define r1 (make-center-percent 5 3))
(define r2 (make-center-percent 5 3))

(define (disp-interval z)
  (newline)
  (display (center z))
  (display " +/- ")
  (display (percent z)))


(par1 r1 r2)
(par2 r1 r2)

(disp-interval r1)
(disp-interval r2)
(disp-interval (div-interval r1 r1))
(disp-interval (div-interval r1 r2))
(disp-interval (div-interval r2 r1))
(disp-interval (div-interval r2 r2))

; 2.15
; She's right, because the program doesn't know about algebraic identities,
; which is why in the first program (which involves division of terms that both
; contain a single "identity") the bounds are larger.

; 2.16 I can write this out but I'm too lazy rn
