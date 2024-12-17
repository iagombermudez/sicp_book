(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (m_j) (dot-product v m_j)) m))

(define (transpose mat)
  (accumulate-n cons nil  mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (i) (matrix-*-vector cols i)) m)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (x) (car x))  seqs))
            (accumulate-n op init (map (lambda (x) (cdr x))  seqs)))))


(define mat (list (list 1 2 3 4)
                  (list 4 5 6 6)
                  (list 6 7 8 9)))

(define vec (list 1 2 3 4))
(display (matrix-*-vector mat vec))
(newline)
(newline)
(display (matrix-*-vector (list (list 1 -1 2) (list 0 -3 1)) (list 2 1 0)))
(newline)
(newline)
(display (transpose mat))
(newline)
(newline)
(display (matrix-*-matrix (list (list 0 4 -2) (list -4 -3 0))
                          (list (list 0 1)
                                (list 1 -1)
                                (list 2 3))))