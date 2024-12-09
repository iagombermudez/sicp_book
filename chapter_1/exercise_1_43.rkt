(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (repeated-iter f f-repeated n)
    (if (= n 0)
        f-repeated
        (repeated-iter f (compose f f-repeated) (- n 1))))
  (repeated-iter f (lambda (x) x) n))

; this version does not need to keep extra variables
(define (repeated-recur f n)
    (if (= n 0)
        (lambda (x) x)
        (compose f (repeated-recur f (- n 1)))))  

(define (square x) (* x x))

((repeated square 2) 5)
((repeated-recur square 2) 5)