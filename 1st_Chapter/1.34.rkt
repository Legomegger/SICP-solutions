#lang racket
(define square (lambda (x) (* x x)))
(define (f g)
  (g 2))

(f square)
(f (lambda (z) (* z (+ z 1))))
(f f)