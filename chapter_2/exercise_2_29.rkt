(define (make-mobile left right)
  (list left right))
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))

(define (make-branch length structure)
  (list length structure))
(define (branch-length branch)
  (if (null? branch)
      0
      (car branch)))
(define (branch-structure branch)
  (if (null? branch)
      0
      (cadr branch)))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

(define (torque branch)
  (* (branch-length branch) (total-weight (branch-structure branch))))
(define (balanced mobile)
  (if (not (pair? mobile))
      #t
      (let ((left (left-branch mobile))
            (right (right-branch mobile)))
        (and (= (torque left) (torque right))
             (balanced (branch-structure left))
             (balanced (branch-structure right))))))
  

(total-weight
 (make-mobile (make-branch 10
                           (make-mobile nil
                                        (make-branch 10 15)))
              (make-branch 10 30)))

(balanced (make-mobile (make-branch 1
                                    (make-mobile (make-branch 1 150)
                                                 (make-branch 3 50)))
                       (make-branch 10 20)))


; Some more tests extracted from
; https://billthelizard.blogspot.com/2011/02/sicp-229-binary-mobiles.html

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))
(total-weight a)
(total-weight b)
(balanced a)
(balanced b)
(define c (make-mobile (make-branch 5 a) (make-branch 3 b)))
(total-weight c)
(balanced c)

(display "Exercise d)")
(newline)

; d. Suppose we change the representation of mobiles so
; that the constructors are
; (define (make-mobile left right) (cons left right))
; (define (make-branch length structure)
;  (cons length structure))
; How much do you need to change your programs to
; convert to the new representation?

; Only need to change the right-branch and branch-structure definitions
; to use cdr instead of cadr
(define (make-mobile left right)
  (cons left right))
(define (right-branch mobile)
  (cdr mobile))

(define (make-branch length structure)
  (cons length structure))
(define (branch-structure branch)
  (if (null? branch)
      0
      (cdr branch)))

(total-weight
 (make-mobile (make-branch 10
                           (make-mobile nil
                                        (make-branch 10 15)))
              (make-branch 10 30)))

(balanced (make-mobile (make-branch 1
                                    (make-mobile (make-branch 1 150)
                                                 (make-branch 3 50)))
                       (make-branch 10 20)))