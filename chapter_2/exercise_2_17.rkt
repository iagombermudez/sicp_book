(define (last-pair elems)
  (if (null? (cdr elems))
    elems
    (last-pair (cdr elems))))

(last-pair (list 23 72 149 34))
