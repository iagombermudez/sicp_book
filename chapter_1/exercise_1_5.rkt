; Exercise 1.5: Ben Bitdiddle has invented a test to determine
; whether the interpreter he is faced with is using applicative-
; order evaluation or normal-order evaluation. He deﬁnes the
; following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
; When using applicative-order, it will be caught in a loop since 
; p is defined as p. Hence, the interpreter will first try to evaluate
; p, getting caught in a loop because p calls itself.

; When using normal-order, the expression will be substituded by the 
; definition, becoming (if (= 0 0) 0 p). This will result in 0, because
; the if operand will evaluate the left argument first. Not using p at all.
; Link to an useful explanation 
; https://cs.stackexchange.com/questions/40758/difference-between-normal-order-and-applicative-order-evaluation
