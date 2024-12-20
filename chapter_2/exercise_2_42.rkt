(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))


(define (make-board-pos x y)
  (cons x y))
(define (board-pos-x pos)
  (car pos))
(define (board-pos-y pos)
  (cdr pos))

(define empty-board nil)
(define (is-pair-safe? pos1 pos2)
  (define (is-same-piece? pos1 pos2)
    (= (board-pos-x pos1) (board-pos-x pos2)))
  (define (is-same-row? pos1 pos2)
    (= (board-pos-y pos1) (board-pos-y pos2)))
  (define (is-same-diagonal? pos1 pos2)
    (or (= (+ (board-pos-y pos1) (- (board-pos-x pos2)
                                (board-pos-x pos1)))
        (board-pos-y pos2))
        (= (+ (board-pos-y pos2) (- (board-pos-x pos2)
                                (board-pos-x pos1)))
        (board-pos-y pos1))))
  (cond ((is-same-piece? pos1 pos2) #t)
        ((is-same-row? pos1 pos2) #f)
        ((is-same-diagonal? pos1 pos2) #f)
        (else #t)))

(define (find-k-queen k queens)
  (if (= k 1)
      (car queens)
      (find-k-queen (- k 1) (cdr queens))))

; Defined this function because I can't use and as parameter
; for some reason
(define (and? x y)
  (and x y))

(define (safe? k positions)
  (accumulate and? #t (map (lambda (x)
                             (if (null? x)
                                 #t
                                 (is-pair-safe? x (find-k-queen k positions))))
                             positions)))

(define (adjoin-position new-pos k positions)
  (append positions (list (make-board-pos k new-pos))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(for-each (lambda (x) (and (display x) (newline))) (queens 8))