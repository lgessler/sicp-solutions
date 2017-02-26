;; 1
(and (supervisor ?name (Ben Bitdiddle))
     (address ?name ?address))

;; 2
(and (salary (Ben Bitdiddle) ?Bens)
     (salary ?Person ?Persons)
     (lisp-value < ?Persons ?Bens))

;; 3
(and (supervisor ?Person ?Supervisor)
     (not (job ?Supervisor (computer . ?RestOfJob)))
     (job ?Supervisor ?SupervisorsJob))
