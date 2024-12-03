; Exercise 1.28: One variant of the Fermat test that cannot
; be fooled is called the Miller-Rabin test (Miller 1976; Rabin
; 1980). This starts from an alternate form of Fermat’s Little
; Theorem, which states that if n is a prime number and a is
; any positive integer less than n, then a raised to the (n−1)-st
; power is congruent to 1 modulo n. To test the primality of a
; number n by the Miller-Rabin test, we pick a random num-
; ber a < n and raise a to the (n − 1)-st power modulo n using
; the expmod procedure. However, whenever we perform the
; squaring step in expmod, we check to see if we have discov-
; ered a “nontrivial square root of 1 modulo n,” that is, a num-
; ber not equal to 1 or n −1 whose square is equal to 1 modulo
; n. It is possible to prove that if such a nontrivial square root
; of 1 exists, then n is not prime. It is also possible to prove
; that if n is an odd number that is not prime, then, for at least
; half the numbers a < n, computing an −1 in this way will
; reveal a nontrivial square root of 1 modulo n. (This is why
; the Miller-Rabin test cannot be fooled.) Modify the expmod
; procedure to signal if it discovers a nontrivial square root
; of 1, and use this to implement the Miller-Rabin test with
; a procedure analogous to fermat-test. Check your pro-
; cedure by testing various known primes and non-primes.
; Hint: One convenient way to make expmod signal is to have
; it return 0.

; TODO: not solved
(define (expmod base exp m)
  (define (square a) (* a a))
  (define (is-not-trivial? a squared-a n)
    (if (and (> a 1) (< a (- n 1)) (= squared-a (remainder 1 n)))
        0
        squared-a))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (is-not-trivial?
                     base
                     (square (expmod base (/ exp 2) m))
                     m)
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))m))))


(define (fermat-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) (display " -> Prime"))
        ((fermat-test n) (fast-prime? n (- times 1)))))

(define (loop n)
  (define (loop-iter n i)
    (display i)
    (fermat-test i)
    (newline)
    (if (< i n)
        (loop-iter n (+ i 1))))
  (loop-iter n 2))

(loop 10)
