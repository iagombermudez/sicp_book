(define (cont-frac n d k)
  (define (recur i)
    (cond ((= i k) (/ (n i) (d i)))
          (else (/ ( n i)
                   (+ (d i)
                      (recur (+ i 1)))))))
  (recur 0))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (cond ((= i 0) (/ (n k) result))
          ((= i k) (iter (- i 1) (+ result  (/ (n i) (d i)))))
          (else (iter (- i 1) (+ (d (- i 1)) (/ (n i) result))))))
  (iter k 0))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 0) x (-(* x x))))
             (lambda (i) (+ 1 (* i 2)))
             k))

(define (tan-cf-iter x k)
  (cont-frac-iter (lambda (i) (cond((= i 0) -x) ; notice how this lambda expression is different than in the recursive version
                                   ((= i k) x)  ; this is due to the fact that the iterative calculates the division starting at the end
                                   (else (-(* x x)))))
                  (lambda (i) (+ 1 (* i 2)))
                  k))

(tan-cf 1 10)
(tan-cf-iter 1 10)
