(#%require sicp-pict)

; 1st way
(define (below painter1 painter2)
  (let ((paint-down
         (transform-painter painter1
                            (make-vect 0 0)
                            (make-vect 1 0 )
                            (make-vect 0 0.5)))
        (paint-up
         (transform-painter painter2
                            (make-vect 0 0.5)
                            (make-vect 1 0.5)
                            (make-vect 0 1))))
    (lambda (frame)
      (paint-up frame)
      (paint-down frame))))

(paint (below einstein diagonal-shading))
          
; 2nd way
(define (flip-hor painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(define (180-flip painter)
  (transform-painter painter
                     (make-vect 1 1)
                     (make-vect 0 1)
                     (make-vect 1 0)))

(define (270-cc-flip painter)
  (transform-painter painter
                     (make-vect 0 1)
                     (make-vect 0 0)
                     (make-vect 1 1)))
   
(define (below painter1 painter2)
  (180-flip (270-cc-flip
             (beside (270-cc-flip einstein)
                     (270-cc-flip einstein)))))

(paint (below einstein diagonal-shading))