;; Original:
(define (parse-verb-phrase)
  (define (maybe-extend verb-phrase)
    (amb 
      verb-phrase
      (maybe-extend 
        (list 'verb-phrase
              verb-phrase
              (parse-prepositional-phrase)))))
  (maybe-extend (parse-word verbs)))

;; Louis's:
(define (parse-verb-phrase)
  (amb (parse-word verbs)
       (list 
         'verb-phrase
         (parse-verb-phrase)
         (parse-prepositional-phrase))))

;; In case the attempt to parse a verb fails, we go to the second branch, which
;; tries to parse a verb phrase. But this leads to an infinite loop. Changing
;; the order doesn't help.

;; This does not happen in the original because the verb-phrase is already
;; parsed.
