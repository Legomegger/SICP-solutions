#lang racket
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? (branch-structure mobile))) (branch-structure mobile))
        (else (+ (total-weight (left-branch mobile))
                 (total-weight (right-branch mobile))))))

(define mobile (make-mobile (make-branch 10
                                         (make-mobile (make-branch 10 10)
                                                      (make-branch 10 10)))
                            (make-branch 10 10)))

(define (get-tree-sum tree)
  (+ (* (branch-structure (left-branch tree))
        (branch-length (left-branch tree)))
     (* (branch-structure (right-branch tree))
        (branch-length (right-branch tree)))))

(define (is-balanced? tree)
  (cond ((null? mobile) #t)
        ((not (pair? (branch-structure tree))) (= (* (branch-structure tree)
                                                     (branch-length tree))
                                                  (is-balanced? (

(define lul (make-mobile (make-branch 10 10) (make-branch 10 10)))
(get-tree-sum lul)
