(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))

(define (interleave lst1 lst2)
    (if (null? lst1)
        lst2
        (cons (car lst1)
            (interleave lst2 (cdr lst1))
        )
    )
)

(define (my-filter pred lst)
    (if (null? lst)
        lst
        (if (pred (car lst))
            (cons (car lst)
                (my-filter pred (cdr lst))
            )
            (my-filter pred (cdr lst))
        )
    )
)

(define (concatenate s)
    (cond (
      (car s)
      (cadr s))
      (concatenate(cons
                (merge (car s)(cadr s))
                (cdr (cdr s)))))
)
