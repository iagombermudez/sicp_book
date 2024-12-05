(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a) (filtered-accumulate combiner
                                             null-value
                                             term
                                             (next a)
                                             next
                                             b
                                             filter)))
        (else (filtered-accumulate combiner null-value term (next a) next b filter))))

; a) Sum of squares of prime numbers
(define (square a) (* a a))
(define (prime? n)
  (define (smallest-divisor n) (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b) (= (remainder b a) 0))
  (= n (smallest-divisor n)))

(define (sum-of-prime-squares a b)
  (filtered-accumulate + 0 square a inc b prime?))

(sum-of-prime-squares 1 15)

; b)

(define (identity a) a)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-relative-prime-integers n)
  (define (is-relative-prime? a)
    (define (filter-gcd i n)
      (and (< i n) (= (gcd i n) 1)))
    (filter-gcd a n))
  (filtered-accumulate * 1 identity 1 inc n is-relative-prime?))

(product-relative-prime-integers 10)
(product-relative-prime-integers 1)
(product-relative-prime-integers 2)
(product-relative-prime-integers 3)
(product-relative-prime-integers 4)
(product-relative-prime-integers 5)
(product-relative-prime-integers 6)
