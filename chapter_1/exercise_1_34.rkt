(define (f g) (g 2))
(f (lambda (z) (* z (+ z 1))))

(f f)
; -> (f 2)
; -> (2 2)
; It wil result in an error because 2 is not a procedure