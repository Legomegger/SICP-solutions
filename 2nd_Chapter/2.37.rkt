#lang racket
(define (accumulate op init seq)
    (if (null? seq)
       init
       (op (car seq)
           (accumulate op init (cdr seq)))))

(define (accumulate-n op init seqs)
   (if (null? (car seqs))
       '()
       (cons (accumulate op init (map car seqs))
             (accumulate-n op init (map cdr seqs)))))

(define (transpose mat)
   (accumulate-n (lambda (x y) (cons x y)) '() mat))
   
(define (dot-product v w)
   (accumulate + 0 (map * v w)))
   
(define (matrix-*-vector m v)
   (map (lambda (x) (dot-product x v)) m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector n x) m)))

(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(transpose m)
(dot-product (list 1 2 3) (list 1 2 3))
(matrix-*-vector m (list 1 2 3))
(matrix-*-matrix (list (list 2 -3 1) (list 5 4 -2)) (list (list 5 - 1 3) (list -7 24)))