(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (if (not (= (remainder x 2) 0))
      0
      (inc (car (/ x 2)))))

(define (cdr x)
  (if (not (= (remainder x 3) 0))
      0
      (inc (cdr (/ x 3)))))

(car (cons 32 44))
(cdr (cons 32 44))