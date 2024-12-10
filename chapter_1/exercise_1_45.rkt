(define tolerance 0.00001)
(define dx 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))


(define (repeated f n)
    (if (= n 0)
        (lambda (x) x)
        (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (pow b e)
  (if (= e 0)
      1
      (* b (pow b (- e 1)))))
(define (log2 x) (/ (log x) (log 2)))

(define (n-root x n)
 (fixed-point ((repeated average-damp (floor (log2 n)))
               (lambda (y) (/ x (pow y (- n 1)))))
               1.0))

(n-root 2 258)