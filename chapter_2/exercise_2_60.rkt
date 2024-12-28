; This code does not change
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; This procedure is now 0(1) instead of 0(n)
; since it is not necessary to check if x is
; an element of the set already
(define (adjoin-set x set)
  (cons x set))

; This is now 0(n) instead of 0(n²) because
; adjoin-set is 0(1)
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

; Same as above, is now 0(n)
(define (union-set set1 set2)
  (append set1 set2))


(intersection-set (list 1 2 3 4) (list 3 4 4 5 6))
(union-set (list 1 2 3 4) (list 3 4 5 6))