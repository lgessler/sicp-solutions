(define (permanent-set? exp) (tagged-list? exp 'permanent-set!))
(define permanent-set-variable assignment-variable)
(define permanent-set-value assignment-value)

(define (analyze-permanent-set exp)
  (let ((var (permanent-set-variable exp))
        (vproc (analyze (permanent-set-value exp))))
    (lambda (env succeed fail)
      (vproc env
             (lambda (val fail2)    ; *1*
               (set-variable-value!
                 var 
                 val 
                 env)
               (succeed 
                 'ok
                 fail2)))
             fail)))
