(define (product a b term next)
  (if (> a b)
      1
      (* (term a) (product (next a) b term next))))


(define (next-factorial a)
  (+ a 1))

(define (identity a)
  a)

(define (is-even? a) (= (remainder a 2) 0))
(product 1 4 identity next-factorial)

(define (next-pi a)
  (+ a 1))

(define (term-pi a)
  (/ (* (* a 2) (* (+ a 1) 2))
     (* (+ (* a 2) 1) (+ (* a 2) 1))))

(* (product 1 1000 term-pi next-pi) 4)

; Iterative version
(define (product-iter a b term next)
  (define (iter a b next term result)
    (if (> a b)
        result
        (iter (next a) b next term (* result (term a)))))
  (iter a b next term 1))

(* (product-iter 1 1000 term-pi next-pi) 4)

    
  
        