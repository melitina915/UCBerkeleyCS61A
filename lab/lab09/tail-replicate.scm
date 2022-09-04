(define (tail-replicate x n)
  ; BEGIN
  (define (tailreplicateop x n far)
    (if (= n 0)
      far
      (tailreplicateop x (- n 1) (cons x far))))
  
  (tailreplicateop x n nil)
  ; END
)
