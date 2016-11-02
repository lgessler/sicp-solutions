; Let's impose a coordinate system: the x axis will be the triangle's
; right edge, and the y axis will be the triangle's left edge. Then 
; f(x, 0) = f(0, y) = 0 for any x and any y. And then 
; f(x, y) = f(x-1, y) + f(x, y-1) in the general case.

; Gives the number in Pascal's triangle at the (x,y) coordinate
(define (f x y)
  (cond ((or (= x 0) (= y 0)) 1)
        (else (+ (f (- x 1) y) (f x (- y 1))))))

(f 0 0)
(f 0 1)
(f 1 0)
(f 1 1)
(f 2 2)
(f 3 3)
