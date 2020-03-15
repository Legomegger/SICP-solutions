#lang racket
(define (accumulate f acc term a next b)
  (if (> a b)
      acc
      (f (term a)
         (accumulate f acc term (next a) b))))
(define (accumulate f acc term a next b)
  (define (iter x acc)
    (if (> x b)
        acc
        (iter (next x) (f (term x) acc)))
    (iter a null)))
