(fold-right / 1 (list 1 2 3)) 
;=> 3/2
(fold-left / 1 (list 1 2 3)) 
;=> 1/6
(fold-right list '() (list 1 2 3))
;=> (3 2 1)
; wrong! it's actually (1 (2 (3 ()))). For some dumb reason I confused
; `list` with `cons`
(fold-left list '() (list 1 2 3))
;=> (((() 1) 2) 3)
