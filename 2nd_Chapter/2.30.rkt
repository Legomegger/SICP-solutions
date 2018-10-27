#lang racket
(define (scale-tree tree factor)
  (cond ((null? tree) null)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))
(scale-tree (list 1 (list 2 (list 3 4) 5) (list 6 7))
            10)

(define (scale-treem tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-treem sub-tree factor)
             (* sub-tree factor)))
       tree))
(scale-treem (list 1 (list 2 (list 3 4) 5) (list 6 7))
            10)

(define (square-treem tree)
  (map (lambda (sub-tree)
       (if (pair? sub-tree)
           (square-tree sub-tree)
           (* sub-tree sub-tree)))
       tree))

(define (square-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(square-tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))

(square-treem (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))