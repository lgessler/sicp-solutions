;; For Ben's procedure, 

(define (count-pairs x)
  (if (not (pair? x))
    0
    (+ (count-pairs (car x))
       (count-pairs (cdr x))
       1)))

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


