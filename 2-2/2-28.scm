; first pass--I wanted to write the lower one but I didn't know the scheme
; keywords
(define (fringe t)
  (cond ((not (pair? t)) (list t))
        ((not (pair? (car t))) t)
        (else (append (fringe (car t)) 
                      (fringe (cdr t))))))

; so clean!
(define (fringe t)
  (cond ((null? t) t)
        ((number? t) (list t))
        (else (append (fringe (car t))
                      (fringe (cdr t))))))

; (1 2 3 3 4)
(fringe (list (list 1 2) (list (list 3 3) 4)))


; (1 2 3 19 283 38 2 3 2 2 3 217 382 1827 2 187 2838 2 1 2 2 3 3 23 2 1 238) 
(fringe (list (list (list 1 2 3 19 283 38) 2 3 2) (list 2 3 (list 217 382 1827) 2 187 (list 2838)) 2 1 2 (list 2 (list 3 (list 3)) 23 2 1 238))) 

