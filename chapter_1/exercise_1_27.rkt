; Exercise 1.27: Demonstrate that the Carmichael numbers
; listed in Footnote 1.47 really do fool the Fermat test. at is,
; write a procedure that takes an integer n and tests whether
; an is congruent to a modulo n for every a < n, and try your
; procedure on the given Carmichael numbers.

(define (test-carmichael n)
 (define (test-carmichael-iter n a)
   (cond ((= a n) (display n)
                  (display " -> PRIME NUMBER")
                  (newline))
         ((= (expmod a n n) a) (test-carmichael-iter n (+ a 1)))
         (else (display n) (newline))))
  (test-carmichael-iter n 1))

(define (expmod base exp m)
  (define (square a) (* a a))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))m))
        (else
         (remainder (* base (expmod base (- exp 1) m))m))))

(define (loop n)
  (define (loop-iter n i)
    (test-carmichael i)
    (if (< i n)
        (loop-iter n (+ i 1))))
  (loop-iter n 2))

(loop 100)

(test-carmichael 561)
(test-carmichael 1105)
(test-carmichael 1729)
(test-carmichael 2465)
(test-carmichael 2821)
(test-carmichael 6601)
