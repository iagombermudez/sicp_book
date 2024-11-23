(define (cube-root x)
  (cube-root-iter 1.0 x x))

(define (cube-root-iter guess value last-guess)
  (if (has-not-changed? guess last-guess)
      guess
      (cube-root-iter (improve guess value) value guess)))

(define (has-not-changed? guess last-guess)
  (< (abs (/ (- guess last-guess) guess)) 0.000000000001))

(define (improve guess value)
  (/ (+ (/ value (square guess))
        (* 2 guess))
     3))
  
(define (square x) (* x x))

(cube-root (- 8))