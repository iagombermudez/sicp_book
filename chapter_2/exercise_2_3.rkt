(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (mid-point segment)
  (make-point (/(+ (x-point (start-segment segment))
                   (x-point (end-segment segment)))
                2)
              (/(+ (y-point (start-segment segment))
                   (y-point (end-segment segment)))
                2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (square x) (* x x))

(define (segment-length segment)
 (let ((first-point (start-segment  segment))
          (second-point (end-segment segment)))
      (sqrt (+ (square (- (x-point second-point) (x-point first-point)))
               (square (- (y-point second-point) (y-point first-point))))))) 
; Necessary code above, exercise starts here

; Area and perimter definitions
(define (area rectangle)
  (* (height rectangle) (width rectangle)))
(define (perimeter rectangle)
  (+ (* 2 (height rectangle))
     (* 2 (width rectangle))))

; Representation 1
(define (make-rectangle-1 origin first-point second-point)
  (cons (make-segment origin first-point)
        (make-segment origin second-point)))
(define (height rectangle)
  (let ((y-1 (y-point (end-segment (car rectangle))))
        (y-2 (y-point (end-segment (cdr rectangle)))))
    (abs (- y-2 y-1))))
(define (width rectangle)
  (let ((x-1 (x-point (end-segment (car rectangle))))
        (x-2 (x-point (end-segment (cdr rectangle)))))
    (abs (- x-2 x-1))))

(let ((rectangle (make-rectangle-1 (make-point 0 0)
                                    (make-point 0 4)
                                    (make-point 7 0))))
  (display (area rectangle))
  (newline)
  (display (perimeter rectangle))
  (newline))

; Representation 2
(define (make-rectangle-2 origin width height angle)
  (cons origin (cons (cons width height) angle)))
(define (height rectangle)
  (cdr (car (cdr rectangle))))
(define (width rectangle)
  (car (car (cdr rectangle))))

(let ((rectangle (make-rectangle-2 (make-point 0 0)
                                    4 
                                    7
                                    30)))
  (display (area rectangle))
  (newline)
  (display (perimeter rectangle)))