(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (is-even? a) (= (remainder a 2 ) 0))

(define (simpsons_rule f a b n)  
  (define (h)
    (/ (- b a) n))
  
  (define (y k)
    (multiplier (f (+ a (* k (h)))) k))

  (define (multiplier f k)
    (cond ((or (= k 0) (= k n)) f)
          ((is-even? k) (* 2 f))
          (else (* 4 f))))

  (define (next a)
    (+ a 1))

  
  (* (/ (h) 3) (sum y 0 next n)))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x) (* x x x))

(display "Original formula: ")
(integral cube 0 1 0.01)
(newline)

(display "Simpson examples: ")
(newline)
(display "N=100: ")
(simpsons_rule cube 0 1 100)
(display "N=1000: ")
(simpsons_rule cube 0 1 1000)
(newline)