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

; Some examples of how to arrive to that formula
; 1 -> (3 * 0) + 1 = 1 * 2
; 4 = (3* 1) + 1 -> 4 = 2 * 2
; 7 = (3 * 2) + 1 -> 6 = 3 * 2
; 10 = (3* 3) + 1 -> 8 = 4 * 2
; 13 = (3* 4) + 1 -> 10 = 5 * 2

(define (denominator i)
  (cond ((= (remainder (+ i 2) 3) 0)
         (* (+ (/ (- i 1) 3)
               1)
            2))
        (else 1)))

(+ 2 (cont-frac (lambda (i) 1.0)
                denominator
                100))


(+ 2 (cont-frac-iter (lambda (i) 1.0)
                     denominator
                     100))
