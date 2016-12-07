(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product v w)) m))

(define (transpose m)
  (accumulate-n (lambda (x y) (cons x y)) '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) 
           (map (lambda (col)
                  (dot-product row col))
                cols)) 
         m)))

(matrix-*-vector
  '((1 2) (3 4))
  '(4 7))

(transpose '((1 2) (3 4)))
(transpose '((1 2 3) (4 5 6)))

(matrix-*-matrix
  '((1 0) (0 1))
  '((3 4) (5 6)))
