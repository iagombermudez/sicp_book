(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))
(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair) 
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))
(define (includes? list element)
  (cond ((null? list) #f)
        ((eq? element (car list)) #t)
        (else (includes? (cdr list) element))))

(define (encode-symbol symbol tree)
  (define (encode-symbol-1 symbol tree bits)
    (cond ((leaf? tree) bits)
          ((includes? (symbols (left-branch tree)) symbol)
           (encode-symbol-1 symbol
                            (left-branch tree)
                            (append bits (list 0))))
          (else (encode-symbol-1 symbol
                                 (right-branch tree)
                                 (append bits (list 1))))))
  (if (not (includes? (symbols tree) symbol))
      (error "Symbol does not exist")
      (encode-symbol-1 symbol tree '())))


(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (if (null? (cdr leaf-set)) (car leaf-set)
      (successive-merge (adjoin-set
                         (make-code-tree (car leaf-set) (cadr leaf-set))
                        (cddr leaf-set)))))
; For N = 5
; For the most frequent, only 1 bit is necessary
; For the least frequen (1), 4 bits will be necessary
(define pairs (list (list '1 1) (list '2 2)
                    (list '3 4) (list '4 8)
                    (list '5 16)))

(define tree (generate-huffman-tree pairs))
(display tree)
(newline)

; For N = 10
; For the most frequent, only 1 bit is necessary
; For the least frequen (1), 9 bits will be necessary
(define pairs (list (list '1 1) (list '2 2)
                    (list '3 4) (list '4 8)
                    (list '5 16) (list '6 32)
                    (list '7 64) (list '8 128)
                    (list '9 256) (list '10 512)))

(define tree (generate-huffman-tree pairs))
(display tree)

; Then, in for general n, 1 bit will be needed for the most common
; and (n-1) bits will be needed for the least common