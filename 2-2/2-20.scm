(define (same-parity l)
  (filter (if (odd? (car l)) odd? even?) (cdr l)))
