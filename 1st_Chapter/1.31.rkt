#lang racket
(define (product next term a b)
  (if (> a b)
      1
      (* (term a)
         (product next term (next a) b))))
(define (inc a) (+ a 1))
(define (id x) x)
(product inc id 1 5)