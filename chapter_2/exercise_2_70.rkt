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

(define pairs (list (list 'A 2) (list 'NA 16)
                    (list 'boom 1) (list 'SHA 3)
                    (list 'GET 2) (list 'yip 9)
                    (list 'JOB 2) (list 'wah 1)))

(define tree (generate-huffman-tree pairs))

(define bits (encode (list 'GET 'A 'JOB
              'SHA 'NA 'NA 'NA 'NA 'NA 'NA 'NA 'NA
              'GET 'A 'JOB
              'SHA 'NA 'NA 'NA 'NA 'NA 'NA 'NA 'NA
              'wah 'yip 'yip 'yip 'yip 'yip 'yip 'yip 'yip 'yip
              'SHA 'boom) tree))

(display (length bits)); 84 bits

; What is the smallest number of bits that would be needed to encode
; this song if we used a fixed-length code for the eight-symbol alphabet?

; Since there are 8 symbols, we would need 3 bits to be able to represent
; 2³ different symbols. per symbol.
; So in total, 36 * 3 bits would be needed (108 bits)