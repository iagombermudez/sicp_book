; Exercise 1.25: Alyssa P. Hacker complains that we went to
; a lot of extra work in writing expmod. Aer all, she says,
; since we already know how to compute exponentials, we
; could have simply written
; (define (expmod base exp m)
;  (remainder (fast-expt base exp) m))
; Is she correct? Would this procedure serve as well for ourfast prime tester? Explain.

(define (even? a) (= (remainder a 2) 0))
(define (square a) (* a a))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; Expmod with fast-expt directly applied in the code (only the first
; instance, then it gets called recusively.
; It can be observed that the remainder procedure is only called once,
; unlike in the original procedure where it gets called every time until
; the exponent is 0.

; This formula is important when understanding how the first program was developed
; (a x b) mod m = ((a mod m) x (b mod m)) mod m
(define (expmod base exp m)
  (remainder
   (cond ((= exp 0) 1)
          ((even? exp)
           (square (fast-expt base (/ exp 2))))
          (else (* base (fast-expt base (- exp 1)))))
   m))

; Both methods work the same, but the main difference is that using fast-exp the
; complete exponentiation is calculated. In the OG version however, the procedure
; remainder is applied every time, keeping the numbers to calculate the remainder
; with smaller.
(expmod 6 3 7)
(remainder (* 6 (expmod 6 2 7)) 7)
(remainder (* 6 (remainder (square (expmod 6 1 7)) 7)) 7)
(remainder (* 6 (remainder (square (remainder (* 6 (expmod 6 0 7)) 7)) 7)) 7)
(remainder (* 6 (remainder (square (remainder (* 6 1) 7)) 7)) 7)
(remainder (* 6 (remainder (square (remainder 6 7)) 7)) 7)
(remainder (* 6 (remainder (square 6) 7)) 7)
(remainder (* 6 (remainder 36 7)) 7)
(remainder (* 6 1) 7)
(remainder 6 7)

(expmod 6 3 7)
(remainder (* 6 (fast-expt 6 2)) 7)
(remainder (* 6 (square (fast-expt 6 1)))7)
(remainder (* 6 (square (* 6 (fast-expt 6 0)))) 7)
(remainder (* 6 (square (* 6 1)))7)
(remainder (* 6 (square 6))7)
(remainder (* 6 36) 7)
(remainder 216 7)
(expmod 6 3 8)

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
