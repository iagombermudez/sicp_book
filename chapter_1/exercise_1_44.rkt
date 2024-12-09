(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))

(define (square x) (* x x))
((smooth square) 4)

(define (repeated f n)
    (if (= n 0)
        (lambda (x) x)
        (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x) (f (g x))))


(sin 3.14152)
((repeated (smooth sin) 10) 3.14152)


