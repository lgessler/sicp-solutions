(define accumulate fold-right)

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

; begin 2-42
(define (repeat elt n)
  (if (= 0 n)
    '()
    (cons elt
          (repeat elt (- n 1)))))

(define (queens board-size)
  (define empty-board (repeat '() board-size))

  (define (safe? k positions)
    (define (take-n l n)
      (if (= n 0)
        '()
        (cons (car l) (take-n (cdr l) (- n 1)))))

    (define (last-placed l)
      (if (or (null? (cdr l)) (null? (cadr l)))
        (car l) 
        (last-placed (cdr l))))

    (define (diagonal-conflict previous just-placed)
      (cdr (fold-right (lambda (pos pair)
                         (let ((offset (car pair))
                               (res (cdr pair)))
                           (cons (+ offset 1) 
                                 (or res (or (= (- pos offset) just-placed)
                                             (= (+ pos offset) just-placed))))))
                       (cons 1 #f)
                       previous)))

    (let ((previous (take-n positions (- k 1)))
          (just-placed (last-placed positions)))
      (not (or (member just-placed previous)
               (diagonal-conflict previous just-placed)))))

  (define (adjoin-position new-row k rest-of-queens)
    (if (not (null? (car rest-of-queens)))
      (cons (car rest-of-queens) (adjoin-position new-row k (cdr rest-of-queens)))
      (cons new-row (cdr rest-of-queens))))

  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row
                                    k
                                    rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(length (queens 4))
(length (queens 5))
(length (queens 6))
(length (queens 7))
(length (queens 8))
