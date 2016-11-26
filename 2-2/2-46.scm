(define (make-vect x y) (cons x y))
(define xcor-vect car)
(define ycor-vect cdr)

(define (binary-op-vect v1 v2 op)
  (make-vect (op (xcor-vect v1) (xcor-vect v2))
             (op (ycor-vect v1) (ycor-vect v2))))

(define (add-vect v1 v2) (binary-op-vect v1 v2 +))
(define (sub-vect v1 v2) (binary-op-vect v1 v2 -))

(define (scale-vect v s) 
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))
