; I think this works?
(define f
  (let ((state 1))
    (lambda (x) 
      (if (= x 0)
        (begin
          (set! state 0)
          state)
        state))))

(+ (f 0) (f 1))


