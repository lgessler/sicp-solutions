(define (deep-reverse l)
  (define (iter old-list new-list)
    (if (null? old-list)
      new-list
      (iter (cdr old-list) 
            (cons 
              (if (list? (car old-list))
                (deep-reverse (car old-list))
                (car old-list))
              new-list))))
  (iter l '()))

(deep-reverse (list (list 1 2) (list 3 4)))
