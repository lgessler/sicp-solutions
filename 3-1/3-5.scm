(define (monte-carlo trials experiment) 
  (define (iter trials-remaining trials-passed) 
    (cond ((= trials-remaining 0) 
           (/ trials-passed trials)) 
          ((experiment) 
           (iter (- trials-remaining 1) (+ trials-passed 1))) 
          (else 
            (iter (- trials-remaining 1) trials-passed)))) 
  (iter trials 0)) 

(define (random-in-range low high) 
  (let ((range (- high low))) 
    (+ low (random range)))) 


(define (pred x y) 
  (< (+ (expt (- x 5) 2) 
        (expt (- y 7) 2)) 
     (expt 3 2))) 

(define (estimate-integral pred x1 x2 y1 y2 number-of-trials) 
  (define (experiment) 
    (pred (random-in-range x1 x2) 
          (random-in-range y1 y2))) 
  (monte-carlo number-of-trials experiment)) 

