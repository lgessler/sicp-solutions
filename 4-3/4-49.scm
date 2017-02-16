;; If amb is a function and not a special form then I think this should work.
;; Otherwise, we could build a recursive function that makes an amb from a list
;; and apply it to the cdr of word-list.
(define (parse-word word-list)
  (list (car word-list) (apply amb (cdr word-list)))) 
