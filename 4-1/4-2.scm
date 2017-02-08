;; This reordering will cause Scheme to attempt to apply the symbol `define`

;; b: we can use these selectors:

(define (application? exp) (tagged-list? exp 'call))
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))

;; this way, a `(define <x> <y>)` would not be interpreted as an application.



