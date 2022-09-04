; Owner and Vehicle Abstraction
(define (make-owner name age)
  (cons name (cons age nil)))

(define (get-name owner) (car owner))

(define (get-age owner) (car (cdr owner)))

(define (make-vehicle model year previous-owners)
  (cons model (cons year previous-owners)))

(define (get-model vehicle) (car vehicle))

(define (get-year vehicle) (car (cdr vehicle)))

(define (get-owners vehicle) (cdr (cdr vehicle)))

(define (older-vehicle vehicle1 vehicle2)
  (define year1 (get-year vehicle1))
    (define year2 (get-year vehicle2))
    (define diff (- year1 year2))
    (if (> diff 0)
        (get-model vehicle2)
        (get-model vehicle1)
    ))

(define (new-owner vehicle owner) (define model (get-model vehicle))
    (define year (get-year vehicle))
    (define owners (cons owner (get-owners vehicle)))
    (make-vehicle model year owners))

(define (owners-names vehicle) (map (lambda (owner) (get-name owner)) (get-owners vehicle)))

(define (split-at lst n) (cond ((= n 0) (cons nil lst))
        ((null? lst) (cons lst nil))
        (else (let ((rec (split-at (cdr lst) (- n 1))))
                (cons (cons (car lst) (car rec)) (cdr rec))))))

; Tree Abstraction
; Constructs tree given label and list of branches
(define (tree label branches)
  (cons label branches))

; Returns the label of the tree
(define (label t) (car t))

; Returns the list of branches of the given tree
(define (branches t) (cdr t))

; Returns #t if t is a leaf, #f otherwise
(define (is-leaf t) (null? (branches t)))

(define (filter-odd t) (cond
		((null? t) nil)
		((odd? (label t)) (tree (label t) (map filter-odd (branches t))))
		(else (tree nil (map filter-odd (branches t))))
	))
