; Exercise 1.26: Louis Reasoner is having great diﬃculty do-
; ing Exercise 1.24. His fast-prime? test seems to run more
; slowly than his prime? test. Louis calls his friend Eva Lu
; Ator over to help. When they examine Louis’s code, they
; ﬁnd that he has rewritten the expmod procedure to use an
; explicit multiplication, rather than calling square:
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base
                       (expmod base (- exp 1) m))
                    m))))
; “I don’t see what difference that could make,” says Louis.
; “I do.” says Eva. “By writing the procedure like that, you
; have transformed the Θ(log n) process into a Θ(n) process.”
; Explain.

; Let's use the developed procedure in Exercise 1.25 to explain:
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

;If we use the procedure from Louis Reasoner, we get the following result.
(expmod 6 3 7)
(remainder (* 6 (expmod 6 2 7)) 7)
(remainder (* 6 (remainder (* (expmod 6 1 7) (expmod 6 1 7)) 7)) 7)
(remainder (* 6 (remainder (* (remainder (* 6 (expmod 6 0 7)) 7)(remainder (* 6 (expmod 6 0 7)) 7)) 7)) 7)
(remainder (* 6 (remainder (* (remainder (* 6 1) 7)(remainder (* 6 1) 7)) 7)) 7)
;...
; It's very clear to see that now the program is repeating calculations due to expmod being called twice
; instead of once, making the program use tree recursion isntead of linear recursion.