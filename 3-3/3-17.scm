;; We can lightly modify Ben's procedure.

(define (append-if-not-in set elt)
  (if (not (memq elt set))
    (cons elt set)
    set))

;; This doesn't work!
(define (count-pairs x)
  (define (recur x seen)
    (if (or (not (pair? x)) (memq x seen))
      0
      (let ((new-seen (cons x seen)))
        (+ (recur (car x) new-seen)
           (recur (cdr x) new-seen)
           1))))
  (recur x '()))

;; This does. The difference is that in the above, branches don't know if they
;; share a pair.
(define (count-pairs x)
  (define seen '())
  (define (recur x)
    (if (or (not (pair? x)) (memq x seen))
      0
      (begin
        (set! seen (cons x seen))
        (+ (recur (car x))
           (recur (cdr x))
           1))))
  (recur x))

;; This returns 3:
(count-pairs '(a b c))

;; This returns 4:
(let ((x '((a b))))
  (set-cdr! x (cdar x))
  (count-pairs x))

;; This returns 7: (shamefully taken from solution site)
(define third (cons 'a 'b))
(define second (cons third third))
(define first (cons second second))
(count-pairs first)

;; This never returns:
(let ((x '(a b c)))
  (set-cdr! (cddr x) x)
  (count-pairs x))


