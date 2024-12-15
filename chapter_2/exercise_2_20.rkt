(define (is-even? a) (= (remainder a 2) 0))

(define (same-parity a . b)
  (define (helper a b)
    (if (null? b)
        nil
        (if (is-even? (+ a (car b))); 2 numbers have same parity when their sum is even 
            (append (list (car b)) (helper a (cdr b)))
            (helper a (cdr b))))) 
  (append (list a) (helper a b)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)