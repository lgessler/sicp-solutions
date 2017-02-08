; original
(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    (cons (eval (first-operand exps) env)
          (list-of-values 
            (rest-operands exps) 
            env))))

; l2r
(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    (let ((left (eval (first-operand exps) env)))
      (let ((right (list-of-values 
                     (rest-operands exps) 
                     env)))
        (cons left right)))))

; r2l
(define (list-of-values exps env)
  (if (no-operands? exps)
    '()
    (let ((right (list-of-values 
                   (rest-operands exps) 
                   env)))
      (let ((left (eval (first-operand exps) env)))
        (cons left right)))))
