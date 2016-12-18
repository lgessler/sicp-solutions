;; A
; Only two types of expressions do not contain an operator in the first
; position: a plain number, and a plain variable.

;; B
; I'll substitute an outline of what you'd do instead of the actual code. You
; would define a procedure `install-sum-package` which would contain definitions
; for `make-sum`, `addend`, `augend`, and `deriv-sum`. The first specifies how
; to make the compound data structure for representing a sum expression. The
; second and third specify how to retrieve different parts of the compound data
; structure (WITH the tag). The fourth specifies how to take the sum's
; derivative.
;
; Finally, at the end of the package, a function called `tag` is defined that
; attaches the type tag to the complex data structure ('+). Then, using a call
; to `put`, the cell for 'deriv '(+) is populated with `deriv-sum`, and the
; cell for 'make-sum '+ is populated with a lambda that calls `make-sum` and
; attaches a tag.

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (install-sum-package) 
  (define (make-sum a1 a2) (cons a1 a2)) 
  (define (addend s) (cadr s)) 
  (define (augend s) (caddr s)) 
  (define (deriv-sum s) 
    (make-sum (deriv (addend s)) (deriv (augend s)))) 

  (define (tag x) (attach-tag '+ x)) 
  (put 'deriv '(+) deriv-sum) 
  (put 'make-sum '+ 
       (lambda (x y) (tag (make-sum x y)))) 
  'done) 

(define (make-sum x y) 
  ((get 'make-sum '+) x y)) 

(define (install-sum-package) 
  (define (make-sum a1 a2) (cons a1 a2)) 
  (define (addend s) (cadr s)) 
  (define (augend s) (caddr s)) 
  (define (deriv-sum s) 
    (make-sum (deriv (addend s)) (deriv (augend s)))) 

  (define (tag x) (attach-tag '+ x)) 
  (put 'deriv '(+) deriv-sum) 
  (put 'make-sum '+ 
       (lambda (x y) (tag (make-sum x y)))) 
  'done) 

(define (make-sum x y) 
  ((get 'make-sum '+) x y)) 


;; Not going to do C. For D, the only difference if you're indexing dispatches
; this way is that you need to swap the order of arguments in `put`.
