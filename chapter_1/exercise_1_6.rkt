; Exercise 1.6: Alyssa P. Hacker doesn’t see why if needs to
; be provided as a special form. “Why can’t I just deﬁine it as
; an ordinary procedure in terms of cond?” she asks. Alyssa’s
; friend Eva Lu Ator claims this can indeed be done, and she
; deﬁines a new version of if:
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
		(else else-clause)))

; Eva demonstrates the program for Alyssa:
(new-if (= 2 3) 0 5)
; 5
(new-if (= 1 1) 0 5)
; 0

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;( Delighted, Alyssa uses new-if to rewrite the square-root
; program:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
		  guess
		  (sqrt-iter (improve guess x) x)))

; What happens when Alyssa attempts to use this to compute
; square roots? Explain.

; The program aborts because maximun recursion depth is exceeded. This
; happens because, unlike when using if, applicative-order is applied.
; This means that instead of checking if is good-enough?, it will 
; inmediately try to evaluate ((sqrt-iter (improve guess x) x)), 
; which will always loop since the arguments do not change. 
(sqrt-iter 5 25)
(new-if (good-enough? 5 25)
	5
	(sqrt-iter (improve 5 25) 25))
(cond ((good-enough? 5 25) 5)
      (else (sqrt-iter (improve 5 25) 25)))

