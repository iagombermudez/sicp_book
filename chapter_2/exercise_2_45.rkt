(#%require sicp-pict)

(define (split f-1 f-2)
  (lambda (img n)
    (if (= n 0)
        img
        (let ((smaller ((split f-1 f-2) img ( - n 1))))
         (f-1 img (f-2 smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 5))
(paint (up-split einstein 5))