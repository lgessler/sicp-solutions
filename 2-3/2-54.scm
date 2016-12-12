(define (equal? l1 l2)
  (cond ((and (null? l1) (null? l2)) #t)
        ((or (null? l1) (null? l2)) #f)
        ((not (eq? (car l1) (car l2))) #f)
        (else (equal? (cdr l1) (cdr l2)))))

; someone else's solution. much better!
(define (equal? a b) 
  (if (and (pair? a) (pair? b)) 
    (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))) 
    (eq? a b))) 

(equal? '(1 2 3) '(1 2))
(equal? '(1 2 3) '(1 2 3))
(equal? '(1 2 3) '(1 2 4))
(equal? '() '(4))
(equal? '(1) '(4))
(equal? '() '())
(equal? '(1 2 3) '(1 2 3))
