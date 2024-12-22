(#%require sicp-pict)
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
                      

(paint (flip-hor einstein))
(paint (180-flip einstein))
(paint (270-cc-flip einstein))