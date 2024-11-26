; Exercise 1.The exponentiation algorithms in this sec-
; tion are based on performing exponentiation by means of
; repeated multiplication. In a similar way, one can perform
; integer multiplication by means of repeated addition. The
; following multiplication procedure (in which it is assumed
; that our language can only add, not multiply) is analogous
; to the expt procedure:

#lang racket/base
(require racket/trace)
(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))
; This algorithm takes a number of steps that is linear in b.
; Now suppose we include, together with addition, opera-
; tions double, which doubles an integer, and halve, which
; divides an (even) integer by 2. Using these, design a mul-
; tiplication procedure analogous to fast-expt that uses a
; logarithmic number of steps.
(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (even? a) (= (remainder a 2) 0))

(define (fast-* a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-* (double a) (halve b)))
        (else (+ a (fast-* a  (- b 1))))))
(trace fast-*)
(fast-* 17 19)