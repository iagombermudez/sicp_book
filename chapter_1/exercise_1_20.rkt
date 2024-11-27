; Exercise 1.20: The process that a procedure generates is
; of course dependent on the rules used by the interpreter.
; As an example, consider the iterative gcd procedure given
; above. Suppose we were to interpret this procedure using
; normal-order evaluation, as discussed in Section 1.1.5. (The
; normal-order-evaluation rule for if is described in Exercise
; 1.5.) Using the substitution method (for normal order), illus-
; trate the process generated in evaluating (gcd 206 40) and
; indicate the remainder operations that are actually per-
; formed. How many remainder operations are actually per-
; formed in the normal-order evaluation of (gcd 206 40)?
; In the applicative-order evaluation?
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Normal order (18 times)
(gcd 206 40)
(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0)) -> (if (= 6 0)) ; 1st time

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0))
    -> (if (= 4 0)); 2nd time (2 times)
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)(remainder 40 (remainder 206 40))))

(if (= (remainder
        (remainder 206 40)
        (remainder 40
                   (remainder 206 40))) 0)) -> if (= 2 0)); 3rd time (4 times)
(gcd (remainder (remainder 206 40)(remainder 40 (remainder 206 40)))
     (remainder
      (remainder 40
                 (remainder 206 40))
      (remainder
       (remainder 206 40)
       (remainder 40
                  (remainder 206 40)))
))

(if (= (remainder
      (remainder 40
                 (remainder 206 40))
      (remainder
       (remainder 206 40)
       (remainder 40
                  (remainder 206 40)))) 0) -> if (= 0 0)); 4th time (7 times)
(remainder (remainder 206 40)(remainder 40 (remainder 206 40))) 
; 5th time (4 times) 


 Applicative order
; remainder will be executed 4 times
(gcd 206 40)
(gcd 40 (remainder 206 40)) -> (gcd 40 6)
(gcd 6 (remainder 40 6)) -> (gcd 6 4)
(gcd 4 (remainder 6 4)) -> (gcd 4 2)
(gcd 2 (remainder 4 2)) -> (gcd 2 0)
(2)