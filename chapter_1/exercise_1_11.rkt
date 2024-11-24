; Exercise 1.11: A function f is defined by the rule that
;         
;          n if n < 3,
; f (n) = 
;          f (n - 1) + 2f (n - 2) + 3f (n - 3) if n ≥ 3.
;         
; Write a procedure that computes f by means of a recursive
; process. Write a procedure that computes f by means of an
; iterative process.

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)


; TODO: iterative version