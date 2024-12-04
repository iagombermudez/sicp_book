(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

; SUM
(define (sum a b next term)
  (accumulate + 0 term a next b))

; PRODUCT
(define (product a b next term)
  (accumulate * 1 term a next b))

(define (identity x) x)
(define (sum-integers a b)
  (sum a b inc identity))

(sum-integers 1 10)

(define (next-pi a)
  (+ a 1))

(define (term-pi a)
  (/ (* (* a 2) (* (+ a 1) 2))
     (* (+ (* a 2) 1) (+ (* a 2) 1))))

(* (product 1 1000 next-pi term-pi) 4)

; ITERATIVE VERSION
(define (accumulate-iter combiner null-value term a next b)
  (define (iter combiner null-value term a next b result)
    (if (> a b)
        result
        (iter combiner null-value term (next a) next b (combiner result (term a)))))
  (iter combiner null-value term a next b null-value))

; SUM
(define (sum-iter a b next term)
  (accumulate-iter + 0 term a next b))

; PRODUCT
(define (product-iter a b next term)
  (accumulate-iter * 1 term a next b))

(define (sum-integers a b)
  (sum-iter a b inc identity))
(sum-integers 1 10)

(* (product-iter 1 1000 next-pi term-pi) 4)