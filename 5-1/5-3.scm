;; I'm just going to write the machine code for the first part

(controller 
  init
    (assign x (op read))
    (assign guess (const 1.0))
  loop
    (test (op good-enough?) (reg guess) (reg x))
    (branch (label done))
    (assign guess (op improve) (reg guess)) ;; assume it doesn't need x
    (goto (label loop))
  done)
