#lang racket
(define (square-tree tree)
  (tree-map square tree))

(define (tree-map f tree)
  (map (lambda (x)
         (if (pair? x)
             (tree-map f x)
             (f x)))
       tree))

(define (square x) (* x x))

(square-tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))