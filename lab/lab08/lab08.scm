(define (over-or-under num1 num2) 
    (cond
	    ((> num1 num2) 1)
	    ((< num1 num2) -1)
	        (else 0))
)

(define (composed f g) (lambda (k) (f (g k))))

(define (square n) (* n n))

(define (pow base exp) 
    (cond 
        ((= base 1) 1)
        ((= exp 0) 1)
        ((= exp 1) base)
        ((even? exp) (square (pow base (/ exp 2))))
        (else (* base (square (pow base (/ (- exp 1) 2))))))
)

(define (ascending? lst) 
    (cond
    [(null? lst) #t]
    [(null? (cdr lst)) #t]
    [(>= (car lst) (car (cdr lst))) #f]
    [else
     (ascending? (cdr lst))])
)
