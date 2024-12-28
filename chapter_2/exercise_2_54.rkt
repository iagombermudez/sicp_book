(define (equal? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((or (null? a) (null? b)) #f)
        ((not (eq? (car a) (car b))) #f)
        (else (equal? (cdr a) (cdr b)))))
(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this is a))
(equal? '(this is a list) '(this (is a) list))