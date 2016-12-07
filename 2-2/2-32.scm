(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(subsets '(1 2 3))

; Explanation: this is a recursive procedure. In the 'base case', we start 
; with a list that contains the empty list. Now, for every item in the 
; set, you could think of the process like this: it "duplicates" every 
; existing element in the accumulator list and appends the item to the
; beginning of each list. The process can be visualized like so:
'(())
'(() (3))
'(() (3) (2) (2 3))
'(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
; Why does this work? I'm still trying to verbalize it. I don't know.
