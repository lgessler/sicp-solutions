
ev-dispatch
  ;; ...
  (test (op cond?) (reg expr))
  (branch (label ev-cond))
  (test (op let?) (reg expr))
  (branch (label ev-let))
ev-cond
  (assign expr (op cond->if) (reg expr))
  (goto (label ev-if))
ev-let
  (assign expr (op let->lambda) (reg expr))
  (goto (label ev-lambda))
