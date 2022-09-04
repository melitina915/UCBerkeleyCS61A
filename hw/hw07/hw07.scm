(define (cadr lst) (car (cdr lst)))

(define (make-kwlist1 keys values)
  (list keys values))

(define (get-keys-kwlist1 kwlist) (car kwlist))

(define (get-values-kwlist1 kwlist)
  (cadr kwlist))

(define (make-kwlist2 keys values)
  (if (null? keys) nil
    (cons (list (car keys) (car values))
          (make-kwlist2 (cdr keys) (cdr values)))))

(define (get-keys-kwlist2 kwlist) (map (lambda (k) (car k)) kwlist))

(define (get-values-kwlist2 kwlist)
  (map (lambda (n) (cadr n)) kwlist))

(define (add-to-kwlist kwlist key value)
  (make-kwlist (append (get-keys-kwlist kwlist) (list key))
  (append (get-values-kwlist kwlist) (list value))))

(define (get-first-from-kwlist kwlist key)
  (if (null? (get-keys-kwlist kwlist))
    nil (let ((values (get-values-kwlist kwlist))
             (keys (get-keys-kwlist kwlist)))
        (cond ((equal? (car keys) key) (car values))
              (else (get-first-from-kwlist
                    (make-kwlist (cdr keys) (cdr values)) key))
              )
        )
  )
)
