(#%require sicp-pict)
; Skipping the a) exercise. I know it's trying to show that when you
; separate your logic in different levels of abstraction, it is easier
; to make changes without affecting the rest of the code.

; b) exercise
(define (split f-1 f-2)
  (lambda (img n)
    (if (= n 0)
        img
        (let ((smaller ((split f-1 f-2) img ( - n 1))))
         (f-1 img (f-2 smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(paint (corner-split einstein 5))

; c) exercise
(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert)))
    (combine4 (corner-split (flip-horiz painter) n)))) ; only needed to change this

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))


(paint (square-limit einstein 5))
  