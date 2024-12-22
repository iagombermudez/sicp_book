
(define (make-vect xcor ycor)
  (cons xcor ycor))
(define (xcor-vect vect)
  (car vect))
(define (ycor-vect vect)
  (cdr vect))


(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (frame-origin frame)
  (car frame))
(define (frame-edge1 frame)
  (cadr frame))
(define (frame-edge2 frame)
  (caddr frame))
(frame-edge2 (make-frame (make-vect 0 0)
            (make-vect 0 1)
            (make-vect 1 1)))


(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (frame-origin frame)
  (car frame))
(define (frame-edge1 frame)
  (cadr frame))
(define (frame-edge2 frame)
  (cddr frame))
(frame-edge2 (make-frame (make-vect 0 0)
            (make-vect 0 1)
            (make-vect 1 1)))

