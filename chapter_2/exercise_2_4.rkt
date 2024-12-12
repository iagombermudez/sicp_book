(define (cons x y)
  (lambda (m) (m x y))) ; m ends up being used as a procude that selects betwen x and y

(define (car z)
  (z (lambda (p q) p))); this just defines the procude that will be used in m

(car (cons 1 2)) ; -> 1
(car (lambda (m) (m 1 2)))
((lambda (m) (m 1 2)) (lambda (p q) p))
((lambda (p q) p) 1 2)


(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 1 2)); -> 2
(cdr (lambda (m) (m 1 2)))
((lambda (m) (m 1 2)) (lambda (p q) q))
((lambda (p q) q) 1 2)