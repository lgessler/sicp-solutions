(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (make-joint new-password)
    (dispatch-factory new-password))
  (define (dispatch-factory password)
    (define (dispatch m p)
      (cond ((not (eq? p password)) "Invalid Password")
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'make-joint) make-joint)
            (else (error "Unknown request: MAKE-ACCOUNT"
                         m))))
    dispatch)
  (dispatch-factory password))

(define (make-joint-account account old-pass joint-pass) 
  (let ((make-joint (account 'make-joint old-pass)))
    (if (not (eq? make-joint "Invalid Password"))
      (make-joint joint-pass)
      "Woops")))

(define a (make-account 100 'foo))
(define b (make-joint-account a 'foo 'bar))


((a 'withdraw 'foo) 20)
((b 'withdraw 'bar) 20)

((b 'withdraw 'foo) 20) ; error
((a 'withdraw 'bar) 20) ; error

