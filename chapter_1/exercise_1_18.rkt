; Exercise 1.18: Using the results of Exercise 1.16 and Exer-
; cise 1.17, devise a procedure that generates an iterative pro-
; cess for multiplying two integers in terms of adding, dou-bling, and halving and uses a logarithmic number of steps.
#lang racket/base
(require racket/trace)
(define (square n) (* n n))
(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))


; The invariant quantity is defined by (a*b) + c
(define (fast-* a b)
  (define (fast-*-iter a b c)
    (cond ((= b 0) c)
           ((even? b) (fast-*-iter (double a) (halve b) c))
           (else (fast-*-iter a  (- b 1) (+ c a)))))
  
  (trace fast-*-iter)
  (fast-*-iter a b 0))
  
 (fast-* 20 12)


