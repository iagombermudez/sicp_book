(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))

(define (square x) (* x x))

(square-list (list 1 2 3 4))
; (iter (list 1 2 3 4) nil)
; (iter (list 2 3 4) (cons 1 nil))
; (iter (list 2 3 4) (cons 4 (cons 1 nil)))
(cons 4 (cons 1 nil))

; This reverses the list, because its apending the result of each
; iteration at the beggining of the list.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

(square-list (list 1 2 3 4))

; This does not work because the last item of the list
; is 1 instead of nil, so it is not a list
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                    (list (square (car things)))))))
  (iter items nil))

(square-list (list 1 2 3 4))
