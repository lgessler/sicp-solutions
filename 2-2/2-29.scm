(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define left-branch car)
(define right-branch cadr)

(define branch-length car)
(define branch-structure cadr)

(define (branch-weight b)
  (let ((struct (branch-structure b)))
    (if (number? struct)
      struct
      (total-weight struct))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define level-1-mobile (make-mobile (make-branch 2 1) 
                                    (make-branch 1 2))) 
(define level-2-mobile (make-mobile (make-branch 3 level-1-mobile) 
                                    (make-branch 9 1))) 
(define level-3-mobile (make-mobile (make-branch 4 level-2-mobile) 
                                    (make-branch 8 2))) 
 
(total-weight level-1-mobile) 
(total-weight level-2-mobile) 
(total-weight level-3-mobile) 


(define (branch-torque b)
  (let ((struct (branch-structure b)))
    (if (number? struct)
      (* (branch-length b) struct)
      (+ (branch-torque (left-branch struct))
         (branch-torque (right-branch struct))))))

(define (balanced? mobile)
  (= (- (branch-torque (left-branch mobile))
        (branch-torque (right-branch mobile)))
     0))

(balanced? level-1-mobile)
(balanced? level-2-mobile)
(balanced? level-3-mobile)
(branch-torque (left-branch level-3-mobile))
(branch-torque (right-branch level-3-mobile))


;d: just the selectors. Yay!
