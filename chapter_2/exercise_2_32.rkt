(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (display rest)
        (newline)
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(display (subsets (list 1 2 3)))

; the reason this works is because after the smallest subset is created,
; this smallest subset is appended with the next element in the original list.
; Then, this new subset is appended to a mapped version of this new subset that
; includes the next element in the list