(define (square a) (* a a))
(define (is-even? a) (= (remainder a 2) 0))
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))


(define (prime? n)
  (= n (smallest-divisor n)))
; Exercise 1.22: Most Lisp implementations include a prim-
; itive called runtime that returns an integer that specifies
; the amount of time the system has been running (mea-
; sured, for example, in microseconds). e following timed-
; prime-test procedure, when called with an integer n, prints
; n and checks to see if n is prime. If n is prime, the procedure
; prints three asterisks followed by the amount of time used
; in performing the test.
(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline)
  1)

; Using this procedure, write a procedure search-for-primes
; that checks the primality of consecutive odd integers in a
; specified range. Use your procedure to find the three small-
; est primes larger than 1000; larger than 10,000; larger than
; 100,000; larger than 1,000,000. Note the time needed to test
; each prime. Since the testing algorithm has order of growth
; of Θ(√n), you should expect
; that testing for primes around
; 10,000 should take about √10 times as long as testing for
; primes around 1000. Do your timing data bear this out?
; How well do the data for 100,000 and 1,000,000 support the
; √Θ( n) prediction? Is your result compatible with the notion
; that programs on your machine run in time proportional to
; the number of steps required for the computation?
(timed-prime-test 8)
 
(define (search-for-primes n)
  (define (search-for-primes-iter n count)
    (cond ((= count 3) (display "Finished"))
          ((timed-prime-test n) (search-for-primes-iter (+ (+ n 1) 1) (+ count 1)))
          (else (search-for-primes-iter (+ (+ n 1) 1) count))))
  (search-for-primes-iter
   (if (is-even? n)
       (+ n 1)
       n)
   0))

(search-for-primes 1000)
(newline)
(search-for-primes 10000)
(newline)
(search-for-primes 100000)
(newline)
(search-for-primes 1000000)