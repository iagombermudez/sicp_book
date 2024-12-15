(define (reverse-list elems)
  (if (null? elems)
      elems
      (append (reverse-list (cdr elems)) (list (car elems)))))
(reverse-list (list 1 2 3 4))


