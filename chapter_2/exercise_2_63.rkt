(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(tree->list-1 (make-tree 7
           (make-tree 3
                      (make-tree 1 '() '())
                      (make-tree 5 '() '()))
           (make-tree 9
                      '()
                      (make-tree 11 '() '()))))


(tree->list-2 (make-tree 7
           (make-tree 3
                      (make-tree 1 '() '())
                      (make-tree 5 '() '()))
           (make-tree 9
                      '()
                      (make-tree 11 '() '()))))


(tree->list-1 (make-tree 3
           (make-tree 1 '() '())
           (make-tree 7
                      (make-tree 5 '() '())
                      (make-tree 9 '() (make-tree 11 '() '())))))

(tree->list-2 (make-tree 3
           (make-tree 1 '() '())
           (make-tree 7
                      (make-tree 5 '() '())
                      (make-tree 9 '() (make-tree 11 '() '())))))


(tree->list-1 (make-tree 5
           (make-tree 3 (make-tree 1 '() '()) '())
           (make-tree 9
                      (make-tree 7 '() '())
                      (make-tree 11 '() '()))))

(tree->list-2 (make-tree 5
           (make-tree 3 (make-tree 1 '() '()) '())
           (make-tree 9
                      (make-tree 7 '() '())
                      (make-tree 11 '() '()))))


; a) They seem to produce the same result for every tree

; b) First one is slower due to append, since the append function appends each
; element of the first list to the second list