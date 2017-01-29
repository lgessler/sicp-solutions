(define (sqrt-stream x)
  (define guesses
    (cons-stream 
      1.0 
      (stream-map
        (lambda (guess)
          (sqrt-improve guess x))
        guesses)))
  guesses)

(define (sqrt-stream x)
  (cons-stream 
    1.0
    (stream-map 
      (lambda (guess)
        (sqrt-improve guess x))
      (sqrt-stream x)))) ;; <-- this is a recursive call that is not memoized
