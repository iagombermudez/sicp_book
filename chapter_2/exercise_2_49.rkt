(#%require sicp-pict)

;square
(paint (segments->painter (list (make-segment (make-vect 0 0) (make-vect 0 1)) 
                         (make-segment (make-vect 0 1) (make-vect 1 1))
                         (make-segment (make-vect 1 1) (make-vect 1 0))
                         (make-segment (make-vect 1 0) (make-vect 0 0)))))

; x
(paint (segments->painter
        (list (make-segment (make-vect 0 0) (make-vect 1 1))
              (make-segment (make-vect 0 1) (make-vect 1 0)))))

; diamond
(paint (segments->painter
        (list (make-segment (make-vect 0 0.5) (make-vect 0.5 1))
              (make-segment (make-vect 0.5 1) (make-vect 1 0.5))
              (make-segment (make-vect 1 0.5) (make-vect 0.5 0))
              (make-segment (make-vect 0.5 0) (make-vect 0 0.5)))))

; wave
; There is absolutely no way you convince me of doing this by hand