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

(let ((segment (make-segment (make-point 1 0) (make-point 3 4))))
  (print-point (start-segment segment))
  (print-point (end-segment segment))
  (let ((mid (mid-point segment)))
    (print-point mid)))
                