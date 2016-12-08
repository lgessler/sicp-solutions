(reverse '(1 2 3))

(define (reverse s)
  (fold-right (lambda (x y)
                ; got stuck here for a while because i forgot both args need
                ; to be lists
                (append y (list x))) 
              '() 
              s))

(reverse '(1 2 3))

(define (reverse s)
  (fold-left (lambda (x y)
               (cons y x))
             '()
             s))

(reverse '(1 2 3))
