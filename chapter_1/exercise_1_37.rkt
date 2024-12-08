(define (cont-frac n d k)
  (cond ((= k 0) (/ (n k) (d k)))
        (else (/ ( n k)
                 (+ (d k)
                    (cont-frac n d (- k 1)))))))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
; K must equal 10 to get an approximation that is accurate to 4 decimal places


; The trick to solve this is to start from the bottom up, if not is impossible
; (or at least very difficult)

(define (cont-frac-iter n d k)
  (define (iter i result)
    (cond ((= i 0) (/ (n k) result))
          ((= i k) (iter (- i 1) (+ result  (/ (n i) (d i)))))
          (else (iter (- i 1) (+ (d (- i 1)) (/ (n i) result))))))
  (iter k 0))

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)              
