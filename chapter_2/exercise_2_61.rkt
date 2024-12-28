(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) (cons x set))
        ((= x (car set)) set)
        ((< (car set) x) (cons (car set) (adjoin-set x (cdr set))))
        (else (cons x set))))

(adjoin-set 0 (list 1 2 3 4))