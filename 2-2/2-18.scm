(define (reverse l)
  (define (iter old-list new-list)
    (if (null? old-list)
      new-list
      (iter (cdr old-list) (cons (car old-list) new-list))))
  (iter l (list)))

(reverse (list 1 2 3))
