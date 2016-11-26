(define (for-each fun l)
  (if (null? l)
    '()
    (let ()
      (fun (car l))
      (for-each fun (cdr l)))))

(for-each (lambda (x) (newline) (display x)) '(1 2 34))
