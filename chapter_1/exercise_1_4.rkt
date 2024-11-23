; Exercise 1.4: Observe that our model of evaluation allows
; for combinations whose operators are compound expres-
; sions. Use this observation to describe the behavior of the
; following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; Depending on the value of b, the operator plus or minus will
; be selected. This is similar to conditionally selecting a function
; in JS, using the same params.


(a-plus-abs-b 2 (- 3))

