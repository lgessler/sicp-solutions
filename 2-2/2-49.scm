; from 2-46
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

; begin 2-48, assume args are vectors
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

; begin 2-49
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame)
           (start-segment segment))
          ((frame-coord-map frame)
           (end-segment segment))))
      segment-list)))

(define bl (make-vect 0 0))
(define br (make-vect 1 0))
(define tr (make-vect 1 1))
(define tl (make-vect 0 1))

(define mid-top (make-vect 0.5 1))
(define mid-bot (make-vect 0.5 0))
(define mid-left (make-vect 0 0.5))
(define mid-right (make-vect 1 0.5))


;a. The painter that draws the outline of the designated frame.
(segments->painter 
  (list (make-segment bl br)
        (make-segment br tr)
        (make-segment tr tl)
        (make-segment tl bl)))

;b. X
(segments->painter 
  (list (make-segment bl tr)
        (make-segment br tl)))

;c. diamond
(segments->painter 
  (list (make-segment mid-top mid-right)
        (make-segment mid-right mid-bot)
        (make-segment mid-bot mid-left)
        (make-segment mid-left mid-top)))

; No way in hell I'm doing d...
