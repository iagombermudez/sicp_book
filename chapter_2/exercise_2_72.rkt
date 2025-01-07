(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))


(define (includes? list element); O(n)
  (cond ((null? list) #f)
        ((eq? element (car list)) #t)
        (else (includes? (cdr list) element))))

(define (encode-symbol symbol tree); 0(n)
  (define (encode-symbol-1 symbol tree bits)
    (cond ((leaf? tree) bits); 1
          ((includes? (symbols (left-branch tree)) symbol); O(n)
           (encode-symbol-1 symbol
                            (left-branch tree)
                            (append bits (list 0))))
          (else (encode-symbol-1 symbol
                                 (right-branch tree)
                                 (append bits (list 1))))))
  (if (not (includes? (symbols tree) symbol))
      (error "Symbol does not exist")
      (encode-symbol-1 symbol tree '())))

; For the most common symbol, it will be O(1);
; For the least common symbol, O(n + (n-1) + (n-2) + ... 1), hence 0(n²)