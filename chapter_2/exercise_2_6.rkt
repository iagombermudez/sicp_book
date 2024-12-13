(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

; The key to solve this is applying substition and
; using back engineering (transforming the final sum of two numbers
; and add procedures until you get the following result
(define (+ a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))

(add-1((zero 0) 0))

(define three (+ one two))

((three (lambda (x) (display "hello") x)) "")
