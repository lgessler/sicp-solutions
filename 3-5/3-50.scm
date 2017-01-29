(define (stream-filter pred stream)
  (cond ((stream-null? stream) 
         the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream 
           (stream-car stream)
           (stream-filter 
             pred
             (stream-cdr stream))))
        (else (stream-filter 
                pred 
                (stream-cdr stream)))))

(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
    the-empty-stream
    (cons-stream
      (apply proc (map stream-car argstreams))
      (apply stream-map
             (cons proc 
                   (map stream-cdr
                        argstreams))))))


