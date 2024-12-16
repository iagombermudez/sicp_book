(define (reverse-list elems)
  (if (null? elems)
      elems
      (append (reverse-list (cdr elems)) (list (car elems)))))


(define (deep-reverse elems)
  (if (or (null? elems) (not (pair? elems)))
      elems
      (append (deep-reverse (cdr elems)) (list (deep-reverse (car elems))))))
(define x (list (list 1 2 (list 5 6 )) (list 3 (list 7 8) 4)))

(display (reverse-list x))
(newline)
(display (deep-reverse x))
