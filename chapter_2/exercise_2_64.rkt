(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts) ; base case
      (let ((left-size (quotient (- n 1) 2))); get size of left branch
        (let ((left-result (partial-tree elts left-size))); calculate elements for left branch
          (let ((left-tree (car left-result)); get elements of left branch
                (non-left-elts (cdr left-result)); get elements that are remaining
                (right-size (- n (+ left-size 1)))); calculate right size
            (let ((this-entry (car non-left-elts)); get next element to include
                  (right-result (partial-tree (cdr non-left-elts); calculate elements for right branch
                                              right-size)))
              (let ((right-tree (car right-result)); get elements of right branch
                    (remaining-elts (cdr right-result))); get elements that are remaining
                (cons (make-tree this-entry left-tree right-tree); build the tree, 
                      remaining-elts)))))))); return remaining elements not included yet

; It divides the list in two, selecting the middle element as the root of the tree. After
; this, with the elements remaining, the procedure is called again for each sublist of elements.
; This is repeated until there are no elements left in any of the sublists.
; Then, the tree is built from the bottom up.

; The order of growth is 0(n), since the procedure is only called once per element
(list->tree (list 1 3 5 7 9 11))

; The result tree
;5
;|   \ 
;1    9
;|\   |\
;  3  7 11