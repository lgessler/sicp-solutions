(define (below p1 p2)
  (let ((paint-bottom 
          (transform-painter painter1
                             (make-vect 0.0 0.0)
                             (make-vect 1.0 0.0)
                             (make-vect 0.0 0.5)))
        (paint-top
          (transform-painter painter2
                             (make-vect 0.0 0.5)
                             (make-vect 1.0 0.0)
                             (make-vect 0.0 0.5))))
    (lambda (frame)
      (paint-bottom frame)
      (paint-top frame))))

; way 2
(define (below p1 p2)
  (rotate90 (beside (rotate270 p1) (rotate270 p2))))
