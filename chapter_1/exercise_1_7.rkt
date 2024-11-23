; Exercise 1.7: The good-enough? test used in computing
; square roots will not be very eﬀective for ﬁinding the square
; roots of very small numbers. Also, in real computers, arith-
; metic operations are almost always performed with lim-
; ited precision. This makes our test inadequate for very large
; numbers. Explain these statements, with examples showing
; how the test fails for small and large numbers. An alterna-
; tive strategy for implementing good-enough? is to watch
; how guess changes from one iteration to the next and to
; stop when the change is a very small fraction of the guess.
; Design a square-root procedure that uses this kind of end
; test. Does this work better for small and large numbers?
(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; Examples of failures
(sqrt 0.000000000000001) ;results in .03125000000001066
;(sqrt 980931238902132) will not terminate 
(define (has-not-changed? guess last_guess)
  (< (abs (/ (- guess last_guess) guess)) 0.000000000001))
; Divide (guess - last_guess) / guess for normalization porpueses

(define (sqrt-iter-2 guess x last_guess)
  (if (has-not-changed? guess last_guess)
	guess
	(sqrt-iter-2 (improve guess x) x guess))) 

(define (sqrt-2 x)
  (sqrt-iter-2 1.0 x x))

(sqrt-2 2)
(sqrt-2 0.000000000000001)
